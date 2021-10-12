"""
Copyright (c) 2021 Huawei Technologies Co.,Ltd.

openGauss is licensed under Mulan PSL v2.
You can use this software according to the terms and conditions of the Mulan PSL v2.
You may obtain a copy of Mulan PSL v2 at:

          http://license.coscl.org.cn/MulanPSL2

THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
See the Mulan PSL v2 for more details.
"""
"""
Case Type   : GUC-备机xlog归档
Case Name   : 1主1备1级联 主机不开启归档 1备机不开启-级联备开启归档 期望：主备均成功，级联备不归档
Description :
    1.主备查询参数默认值
    show synchronous_standby_names;
    show synchronous_commit;
    show archive_mode;
    show archive_dest;
    2.1主1备1级联创建xlog归档地址
    rm -rf /home/$user/xlog
    mkdir /home/$user/xlog
    3.设置所有备机为异步 级联备开启归档
    gs_guc reload -D {dn1} -c "synchronous_standby_names=''"
    级联备设置
    gs_guc reload -D {dn1} -c "archive_mode=on"
    gs_guc reload -D {dn1} -c "archive_dest='/home/$user/xlog'"
    4.主机执行xlog切换
    select pg_switch_xlog();
    5.查看主备归档路径
    ll /home/$user/xlog
    6.恢复环境
    rm -rf /home/$user/xlog
    gs_guc reload -D {dn1} -c "synchronous_standby_names='*'"
    gs_guc reload -D {dn1} -c "archive_mode=off"
    gs_guc reload -D {dn1} -c "archive_dest=''"
Expect      :
    1.显示默认值
    2.创建归档地址成功
    3.设置成功，重启成功
    4.切换成功
    5.1主1备1级联 无归档文件
    6.清理环境
History     :
"""

import time
import unittest

from testcase.utils.Common import Common
from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger
from yat.test import Node
from yat.test import macro

LOGGER = Logger()
COMMONSH = CommonSH("PrimaryDbUser")


@unittest.skipIf(1 == COMMONSH.get_node_num(), "单机不执行")
class Guctestcase(unittest.TestCase):
    def setUp(self):
        LOGGER.info("==Opengauss_Function_Guc_WAL_Case0097 start==")
        self.userNode = Node("PrimaryDbUser")
        self.s_node1 = Node("Standby1DbUser")
        self.s_node2 = Node("Standby2DbUser")
        self.s_com1 = CommonSH("Standby1DbUser")
        self.s_com2 = CommonSH("Standby2DbUser")
        self.common = Common()
        self.constant = Constant()
        self.path = f"{macro.DB_INSTANCE_PATH}/../sxlog"
        LOGGER.info("重启检查数据库状态")
        status = COMMONSH.get_db_cluster_status("detail")
        LOGGER.info(status)
        self.assertTrue("Normal" in status or "Degraded" in status)
        status = COMMONSH.restart_db_cluster()
        LOGGER.info(status)
        status = COMMONSH.get_db_cluster_status("detail")
        LOGGER.info(status)
        self.assertTrue("Normal" in status or "Degraded" in status)
        self.full_com_list = [COMMONSH, self.s_com1, self.s_com2]
        self.test_com_list = [self.s_com1, self.s_com2]
        self.full_node_list = [self.userNode, self.s_node1, self.s_node2]

        LOGGER.info("查询synchronous_standby_names默认值")
        result = COMMONSH.execut_db_sql("show synchronous_standby_names")
        LOGGER.info(f"primary synchronous_standby_names is {result}")
        self.synchronous_standby_names_p = result.strip().splitlines()[-2]

    def set_guc(self, param, value, method="set", com=COMMONSH, single=False):
        sql_cmd = com.execut_db_sql(f"show {param}")
        LOGGER.info(sql_cmd)
        if f"{value}" != sql_cmd.splitlines()[-2].strip():
            com.execute_gsguc(method,
                              self.constant.GSGUC_SUCCESS_MSG,
                              f"{param}={value}",
                              single=f"{single}")
        LOGGER.info(f"{param} is {value}")

    def switch_xlog(self, com=COMMONSH):
        for j in range(60):
            result = com.execut_db_sql("select pg_is_in_recovery()")
            LOGGER.info(result)
            if "f\n" in result:
                result = com.execut_db_sql("select pg_switch_xlog();")
                LOGGER.info(result)
                self.assertTrue("/" in result)
                break
            else:
                time.sleep(10)

    def test_standby_xlog(self):
        LOGGER.info("执行前：主备所有节点查询参数,确保默认值")
        for com in self.full_com_list:
            self.set_guc("archive_mode", "off", "reload", com)
            self.set_guc("archive_dest", "''", "reload", com)

        LOGGER.info("步骤1：1主2备创建归档地址")
        for node in self.full_node_list:
            sql = f"rm -rf {self.path};mkdir {self.path};ls {self.path}"
            LOGGER.info(sql)
            result = self.common.get_sh_result(node, sql)
            LOGGER.info(result)
            self.assertNotIn("No such file or directory", result)

        LOGGER.info("以级联备build备2")
        result = self.s_com2.execute_gsctl("build",
                                           "server started",
                                           param="-M cascade_standby")
        LOGGER.info(result)
        self.assertTrue(result)
        result = self.s_com2.exec_refresh_conf()
        LOGGER.info(result)
        self.assertTrue(result)
        status = COMMONSH.get_db_cluster_status("detail")
        LOGGER.info(status)
        self.assertTrue("S Cascade Normal" in status)
        self.assertTrue("cluster_state   : Normal" in status)

        LOGGER.info("步骤2：主机设置")
        self.set_guc("synchronous_standby_names", "''", "reload",
                     COMMONSH, True)
        self.set_guc("synchronous_commit", "on", "reload")

        sql_cmd = COMMONSH.execut_db_sql("show synchronous_standby_names;"
                                         "show synchronous_commit;"
                                         "show archive_dest;")
        LOGGER.info(sql_cmd)
        self.assertIn("\n", sql_cmd)
        self.assertNotIn("off\n", sql_cmd)
        self.assertIn("on\n", sql_cmd)

        LOGGER.info("步骤3：备2-级联备设置")
        self.set_guc("archive_mode", "on", "reload", self.s_com2, True)
        self.set_guc("archive_dest", f"'{self.path}'", "reload", self.s_com2,
                     True)

        sql_cmd = self.s_com2.execut_db_sql(
            "show archive_mode;show archive_dest")
        LOGGER.info(sql_cmd)
        self.assertNotIn("off\n", sql_cmd)
        self.assertIn("on\n", sql_cmd)
        self.assertIn(f"{self.path}\n", sql_cmd)

        LOGGER.info("步骤4+5：查看备1归档+1")
        sql = f'''cd {self.path};ls -l|grep "^-"| wc -l'''
        LOGGER.info("主机+备1+级联备归档文件为0")
        for node in self.full_node_list:
            num = int(node.sh(sql).result())
            LOGGER.info(num)
            self.assertEqual(0, num)

    def tearDown(self):
        LOGGER.info("步骤6：恢复默认值")
        for com in self.test_com_list:
            result = com.execute_gsctl("build",
                                       "server started",
                                       param="-M standby")
            LOGGER.info(result)
            result = com.exec_refresh_conf()
            LOGGER.info(result)

        for com in self.full_com_list:
            self.set_guc("archive_mode", "off", "reload", com)
            self.set_guc("archive_dest", "''", "reload", com)
            self.set_guc("archive_timeout", 0, "reload")

        self.set_guc("synchronous_standby_names",
                     f"'{self.synchronous_standby_names_p}'",
                     "reload", COMMONSH, True)

        LOGGER.info("1主2备删除归档地址")
        for node in self.full_node_list:
            sql = f"rm -rf {self.path};ls {self.path}"
            LOGGER.info(sql)
            result = self.common.get_sh_result(node, sql)
            LOGGER.info(result)

        status = COMMONSH.restart_db_cluster()
        LOGGER.info(status)
        status = COMMONSH.get_db_cluster_status("detail")
        self.assertTrue("Normal" in status or "Degraded" in status)
        LOGGER.info("==Opengauss_Function_Guc_WAL_Case0097 finish==")
