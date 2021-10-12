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
Case Type   : GUC
Case Name   : 修改参数failed_login_attempts为其他数据类型及超边界值，并校验其预期结果
Description :
    1、查看failed_login_attempts默认值 期望：10；
    show failed_login_attempts;
    2、修改failed_login_attempts为abc等，期望：合理报错
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts='abc'";
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts=-1";
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts=1001";
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts=''";
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts=' '";
    gs_guc reload -D {cluster/dn1} -c "failed_login_attempts=null";
    3、恢复默认值 无需恢复
Expect      :
    1、查看failed_login_attempts默认值 期望：10；
    2、修改failed_login_attempts为abc等，期望：合理报错
    3、恢复默认值 无需恢复
History     :
"""

import unittest

from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger

LOGGER = Logger()
COMMONSH = CommonSH("PrimaryDbUser")


class Guctestcase(unittest.TestCase):
    def setUp(self):
        LOGGER.info(
            "==Opengauss_Function_Guc_Connectionauthentication_Case0269"
            " start==")
        self.constant = Constant()
        status = COMMONSH.get_db_cluster_status()
        self.assertTrue("Normal" in status or "Degraded" in status)

    def test_guc(self):
        LOGGER.info("步骤1:查询failed_login_attempts 期望：默认值0")
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())

        LOGGER.info("步骤2:修改failed_login_attempts为abc等，期望：修改失败，show参数为默认值")
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts='abc'")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=-1")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=100.926")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=''")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=' '")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=null")
        self.assertFalse(result)
        sql_cmd = COMMONSH.execut_db_sql("show failed_login_attempts;")
        LOGGER.info(sql_cmd)
        self.assertEqual("10", sql_cmd.split("\n")[-2].strip())

    def tearDown(self):
        LOGGER.info("步骤3:恢复默认值")
        result = COMMONSH.execute_gsguc("reload",
                                        self.constant.GSGUC_SUCCESS_MSG,
                                        "failed_login_attempts=10")
        LOGGER.info(result)
        result = COMMONSH.restart_db_cluster()
        LOGGER.info(result)
        status = COMMONSH.get_db_cluster_status()
        self.assertTrue("Normal" in status or "Degraded" in status)
        LOGGER.info(
            "==Opengauss_Function_Guc_Connectionauthentication_Case0269"
            " finish==")
