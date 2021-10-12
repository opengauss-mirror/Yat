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
Case Type   : 工具-GS_BASEBACKUP
Case Name   : 自定义绝对路径表空间，远程备份，开启进度报告，开启冗余模式，出现输入密码提示
Description :
    1、开始备份：gs_basebackup -D /home/function0126/gs_basebackup -p 30126 -T
        /data/function0126/cluster/tablespace_test1=
        /data/function0126/cluster/tablespace_test2
        -P -v -W -h ip
    2、使用备份目录启动数据库
Expect      :
    1、备份提示成功，/data/function0126/cluster/tablespace_test2目录不为空
    2、使用备份目录启动数据库成功，并且数据与备份前一致
History     :
"""

import os
import time
import unittest

from yat.test import Node
from yat.test import macro

from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger

Primary_SH = CommonSH('PrimaryDbUser')


@unittest.skipIf(1 == Primary_SH.get_node_num(),
                 '需主备环境，若为单机环境则不执行')
class GsBaseBackUpCase28(unittest.TestCase):
    def setUp(self):
        self.Primary_User_Node = Node('PrimaryDbUser')
        self.Primary_Root_Node = Node('PrimaryRoot')
        self.Standby1_User_Node = Node('Standby1DbUser')
        self.Standby1_Root_Node = Node('Standby1Root')
        self.LOG = Logger()
        self.Constant = Constant()
        self.T_NAME = 't_basebackup_28'
        self.Old_TableSpace_Name = 'tablespace_old'
        self.Old_TableSpace_Path = os.path.join(
            os.path.dirname(macro.DB_INSTANCE_PATH), 'tablespace_old')
        self.New_TableSpace_Path = os.path.join(
            os.path.dirname(macro.DB_INSTANCE_PATH), 'tablespace_new')
        self.backup_bak_path = os.path.join(macro.DB_BACKUP_PATH,
                                            'gs_basebackup')
        self.gs_basebackup_bak_name = 'gs_basebackup_Case0028.bak'
        self.LOG.info(
            '----Opengauss_Function_Tools_gs_basebackup_Case0028 start----')

    def test_server_tools(self):
        self.LOG.info('----主备机创建备份目录----')
        mkdir_cmd = f'''if [ ! -d "{self.backup_bak_path}" ]
                                then
                                    mkdir -p {self.backup_bak_path}
                                fi'''
        primary_result = self.Primary_User_Node.sh(mkdir_cmd).result()
        self.LOG.info(primary_result)
        self.assertEqual(primary_result, '')
        standby1_result = self.Standby1_User_Node.sh(mkdir_cmd).result()
        self.LOG.info(standby1_result)
        self.assertEqual(standby1_result, '')

        self.LOG.info('----主机创建表空间目录及重定向目录----')
        is_dir_exists_cmd = f'''if [ ! -d "{self.Old_TableSpace_Path}" ]
                                then
                                    mkdir -p {self.Old_TableSpace_Path}
                                fi'''
        result = self.Primary_User_Node.sh(is_dir_exists_cmd).result()
        self.LOG.info(result)
        self.assertEqual(result, '')

        self.LOG.info('----备机创建重定向目录----')
        is_dir_exists_cmd = f'''if [ ! -d "{self.New_TableSpace_Path}" ]
                                then
                                    mkdir -p {self.New_TableSpace_Path}
                                fi'''
        result = self.Standby1_User_Node.sh(is_dir_exists_cmd).result()
        self.LOG.info(result)
        self.assertEqual(result, '')

        self.LOG.info('----主备机修改备份目录权限700，以免权限有误----')
        chmod_cmd = f"chmod 700 -R {self.backup_bak_path}"
        self.LOG.info(chmod_cmd)
        primary_chmod_msg = self.Primary_Root_Node.sh(chmod_cmd).result()
        self.LOG.info(primary_chmod_msg)
        self.assertEqual(primary_chmod_msg, '')
        standby1_chmod_msg = self.Standby1_Root_Node.sh(chmod_cmd).result()
        self.LOG.info(standby1_chmod_msg)
        self.assertEqual(standby1_chmod_msg, '')

        self.LOG.info('----主备机查看备份目录----')
        ls_cmd = f"ls -l {os.path.dirname(self.backup_bak_path)}"
        self.LOG.info(ls_cmd)
        primary_ls_msg = self.Primary_User_Node.sh(ls_cmd).result()
        self.LOG.info(primary_ls_msg)
        standby1_ls_msg = self.Primary_User_Node.sh(ls_cmd).result()
        self.LOG.info(standby1_ls_msg)

        self.LOG.info('----主机创建测试表空间及表---')
        sql_cmd = f"drop tablespace if exists {self.Old_TableSpace_Name};" \
            f"create tablespace {self.Old_TableSpace_Name} " \
            f"location '{self.Old_TableSpace_Path}';" \
            f"drop table if exists {self.T_NAME}; " \
            f"create table {self.T_NAME}(a int);" \
            f"insert into {self.T_NAME} values (generate_series(1,10000));"
        self.LOG.info(sql_cmd)
        sql_result = Primary_SH.execut_db_sql(sql_cmd)
        self.LOG.info(sql_result)
        self.assertIn(self.Constant.TABLESPCE_CREATE_SUCCESS, sql_result)
        self.assertIn(self.Constant.CREATE_TABLE_SUCCESS, sql_result)
        self.assertIn(self.Constant.INSERT_SUCCESS_MSG, sql_result)

        self.LOG.info('----备机执行远程备份----')
        gs_basebackup_cmd = f"gs_basebackup " \
            f"-D {self.backup_bak_path} " \
            f"-p {self.Primary_User_Node.db_port} " \
            f'-h {self.Primary_User_Node.ssh_host} ' \
            f"-T {self.Old_TableSpace_Path}={self.New_TableSpace_Path} " \
            f"-P " \
            f"-v " \
            f"-W"
        backup_cmd = f'''source {macro.DB_ENV_PATH}
            expect <<EOF
            set timeout 1200
            spawn {gs_basebackup_cmd}
            expect "*assword:"
            send "{self.Primary_User_Node.ssh_password}\\n"
            expect "*assword:"
            send "{self.Primary_User_Node.ssh_password}\\n"
            expect "{self.Constant.gs_basebackup_success_msg}" 
            send_user "执行成功";exit
            expect eof\n''' + '''EOF'''
        self.LOG.info(backup_cmd)
        backup_msg = self.Standby1_User_Node.sh(backup_cmd).result()
        self.LOG.info(backup_msg)
        self.assertIn("执行成功", backup_msg)

        self.LOG.info('----查看重定向目录----')
        ls_new_cmd = f"ls {self.New_TableSpace_Path}"
        self.LOG.info(ls_new_cmd)
        ls_new_result = self.Standby1_User_Node.sh(ls_new_cmd).result()
        self.LOG.info(ls_new_result)
        ls_old_cmd = f"ls {self.Old_TableSpace_Path}"
        self.LOG.info(ls_old_cmd)
        ls_old_result = self.Primary_User_Node.sh(ls_old_cmd).result()
        self.LOG.info(ls_old_result)
        self.assertEqual(ls_new_result, ls_old_result)

        self.LOG.info('----scp备份文件到主机----')
        scp_cmd = f"scp -r {os.path.join(self.backup_bak_path, '*')}" \
            f" {self.Primary_User_Node.ssh_user}@" \
            f"{self.Primary_User_Node.ssh_host}:" \
            f"{self.backup_bak_path}"
        self.LOG.info(scp_cmd)
        scp_msg = self.Standby1_User_Node.sh(scp_cmd).result()
        self.LOG.info(scp_msg)
        self.assertNotIn('failed', scp_msg)

        self.LOG.info('----停止数据库----')
        is_stopped = Primary_SH.execute_gsctl(
            'stop', self.Constant.GS_CTL_STOP_SUCCESS_MSG)
        self.assertTrue(is_stopped)

        time.sleep(5)

        self.LOG.info('----使用备份目录启动数据库----')
        start_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl start -D {self.backup_bak_path} -M primary"
        self.LOG.info(start_cmd)
        start_msg = self.Primary_User_Node.sh(start_cmd).result()
        self.LOG.info(start_msg)
        self.assertIn(self.Constant.RESTART_SUCCESS_MSG, start_msg)

        self.LOG.info('----重建备机需主备连接正常----')
        result = Primary_SH.wait_cluster_connected(self.backup_bak_path)
        self.assertTrue(result)

        self.LOG.info('----重建备机----')
        build_msg_list = Primary_SH.get_standby_and_build()
        for msg in build_msg_list:
            self.assertIn(self.Constant.BUILD_SUCCESS_MSG, msg)

        self.LOG.info('----查询数据库状态确认是否启动成功----')
        query_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl query -D {self.backup_bak_path}"
        self.LOG.info(query_cmd)
        query_msg = self.Primary_User_Node.sh(query_cmd).result()
        self.LOG.info(query_msg)
        self.assertIn('db_state', query_msg)
        for arg in query_msg.splitlines():
            if 'db_state' in arg:
                self.assertIn('Normal', arg)

        self.LOG.info('----查询测试表是否存在----')
        sql_cmd = f"select * from {self.T_NAME};"
        self.LOG.info(sql_cmd)
        sql_msg = Primary_SH.execut_db_sql(sql_cmd)
        self.assertIn('10000 rows', sql_msg)

    def tearDown(self):
        self.LOG.info('----停止数据库----')
        stop_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl stop -D {self.backup_bak_path}"
        self.LOG.info(stop_cmd)
        stop_msg = self.Primary_User_Node.sh(stop_cmd).result()
        self.LOG.info(stop_msg)

        self.LOG.info('----使用原目录启动数据库----')
        start_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_om -t restart"
        self.LOG.info(start_cmd)
        start_msg = self.Primary_User_Node.sh(start_cmd).result()
        self.LOG.info(start_msg)

        self.LOG.info('----重建备机需主备连接正常----')
        result = Primary_SH.wait_cluster_connected()
        self.LOG.info(result)

        self.LOG.info('----重建备机----')
        build_msg_list = Primary_SH.get_standby_and_build()
        self.LOG.info(build_msg_list)

        self.LOG.info('----删除测试表空间和表----')
        sql_cmd = f"drop table if exists {self.T_NAME}; " \
            f"drop tablespace if exists {self.Old_TableSpace_Name}"
        self.LOG.info(sql_cmd)
        sql_msg = Primary_SH.execut_db_sql(sql_cmd)
        self.LOG.info(sql_msg)

        self.LOG.info('----删除备份文件和表空间目录----')
        is_dir_exists_cmd = f"rm -rf {self.backup_bak_path} " \
            f"{self.New_TableSpace_Path} " \
            f"{self.Old_TableSpace_Path}"
        result = self.Primary_User_Node.sh(is_dir_exists_cmd).result()
        self.LOG.info(result)
        result = self.Standby1_User_Node.sh(is_dir_exists_cmd).result()
        self.LOG.info(result)

        self.LOG.info(
            '----Opengauss_Function_Tools_gs_basebackup_Case0028 end----')
