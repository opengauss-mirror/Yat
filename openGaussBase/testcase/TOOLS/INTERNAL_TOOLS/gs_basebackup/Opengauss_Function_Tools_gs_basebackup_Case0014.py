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
Case Name   : 不自定义表空间，本地备份，开启进度报告，开启冗余模式，检查点模式设置为fast,不出现输入密码提示,t模式压缩备份
Description :
    1.执行备份：gs_basebackup -D /usr2/chenchen/basebackup/bak_Pvfast_wt
        -Ft -Xfetch -p 18333 -l gauss_15.bak -P -v -U sysadmin -w
    2.解压备份包：gs_tar -D /wyc/tmp/backup/tmp -F /wyc/tmp/backup/base.tar
    3.使用备份目录启动数据库
Expect      :
    1、备份提示成功，备份目录下生成备份文件
    2、解压出备份数据
    3、使用备份目录启动数据库成功，并且数据与备份前一致
History     :
"""

import os
import time
import unittest

from yat.test import Node
from yat.test import macro

from testcase.utils.Logger import Logger
from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant

Primary_SH = CommonSH('PrimaryDbUser')


@unittest.skipIf(1 == Primary_SH.get_node_num(),
                 '需主备环境，若为单机环境则不执行')
class GsBaseBackUpCase14(unittest.TestCase):
    def setUp(self):
        self.Primary_User_Node = Node('PrimaryDbUser')
        self.Primary_Root_Node = Node('PrimaryRoot')
        self.LOG = Logger()
        self.Constant = Constant()
        self.gs_basebackup_bak_path = os.path.join(macro.DB_BACKUP_PATH,
                                                   'gs_basebackup')
        self.tar_path = os.path.join(macro.DB_BACKUP_PATH,
                                     'gs_basebackup_tar')
        self.TAR_NAME = 'base.tar'
        self.gs_basebackup_bak_name = 'gs_basebackup_Case0014.bak'
        self.LOG.info(
            '----Opengauss_Function_Tools_gs_basebackup_Case0014 start----')

    def test_server_tools(self):
        self.LOG.info('----创建备份目录----')
        mkdir_cmd = f'''if [ ! -d "{self.gs_basebackup_bak_path}" ]
                        then
                            mkdir -p {self.gs_basebackup_bak_path}
                        else
                            rm -rf {os.path.join(self.gs_basebackup_bak_path,
                                                 '*')}
                        fi
                        if [ ! -d "{self.tar_path}" ]
                        then
                            mkdir -p {self.tar_path}
                        else
                            rm -rf {os.path.join(self.tar_path, '*')}
                        fi'''
        mkdir_result = self.Primary_User_Node.sh(mkdir_cmd).result()
        self.LOG.info(mkdir_result)
        self.assertEqual(mkdir_result, '')

        self.LOG.info('----修改备份/解压目录权限700，以免权限有误----')
        chmod_cmd = f"chmod 700 -R {self.gs_basebackup_bak_path}; " \
            f"chmod 700 -R {self.tar_path}"
        self.LOG.info(chmod_cmd)
        chmod_msg = self.Primary_Root_Node.sh(chmod_cmd).result()
        self.LOG.info(chmod_msg)
        self.assertEqual(chmod_msg, '')

        self.LOG.info('----查看备份/解压目录----')
        ls_cmd = f"ls -l {os.path.dirname(self.gs_basebackup_bak_path)}"
        self.LOG.info(ls_cmd)
        ls_msg = self.Primary_User_Node.sh(ls_cmd).result()
        self.LOG.info(ls_msg)

        self.LOG.info('----执行备份----')
        gs_basebackup_cmd = f"gs_basebackup " \
            f"-D {self.gs_basebackup_bak_path} " \
            f"-Ft " \
            f"-Xfetch " \
            f"-p {self.Primary_User_Node.db_port} " \
            f"-l {self.gs_basebackup_bak_name} " \
            f"-P " \
            f"-v " \
            f"-U {self.Primary_User_Node.ssh_user} " \
            f"-w"
        backup_cmd = f"source {macro.DB_ENV_PATH}; {gs_basebackup_cmd}"
        self.LOG.info(backup_cmd)
        backup_msg = self.Primary_User_Node.sh(backup_cmd).result()
        self.LOG.info(backup_msg)
        self.assertIn(self.Constant.gs_basebackup_success_msg, backup_msg)

        self.LOG.info('----查看备份文件----')
        ls_cmd = f"ls -l {self.gs_basebackup_bak_path}"
        self.LOG.info(ls_cmd)
        ls_msg = self.Primary_User_Node.sh(ls_cmd).result()
        self.LOG.info(ls_msg)

        self.LOG.info('----解压备份包----')
        command_var = os.path.join(self.gs_basebackup_bak_path,
                                   self.TAR_NAME)
        tar_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_tar -D {self.tar_path} -F {command_var}"
        self.LOG.info(tar_cmd)
        tar_msg = self.Primary_User_Node.sh(tar_cmd).result()
        self.LOG.info(tar_msg)

        self.LOG.info('----停止数据库----')
        is_stopped = Primary_SH.execute_gsctl(
            'stop', self.Constant.GS_CTL_STOP_SUCCESS_MSG)
        self.assertTrue(is_stopped)

        time.sleep(5)

        self.LOG.info('----使用备份目录启动数据库----')
        start_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl start -D {self.tar_path} -M primary"
        self.LOG.info(start_cmd)
        start_msg = self.Primary_User_Node.sh(start_cmd).result()
        self.LOG.info(start_msg)
        self.assertIn(self.Constant.RESTART_SUCCESS_MSG, start_msg)

        self.LOG.info('----重建备机需主备连接正常----')
        result = Primary_SH.wait_cluster_connected(self.tar_path)
        self.assertTrue(result)

        self.LOG.info('----重建备机----')
        build_msg_list = Primary_SH.get_standby_and_build()
        for msg in build_msg_list:
            self.assertIn(self.Constant.BUILD_SUCCESS_MSG, msg)

        self.LOG.info('----查询数据库状态确认是否启动成功----')
        query_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl query -D {self.tar_path}"
        self.LOG.info(query_cmd)
        query_msg = self.Primary_User_Node.sh(query_cmd).result()
        self.LOG.info(query_msg)
        self.assertIn('db_state', query_msg)
        for arg in query_msg.splitlines():
            if 'db_state' in arg:
                self.assertIn('Normal', arg)

    def tearDown(self):
        self.LOG.info('----停止数据库----')
        stop_cmd = f"source {macro.DB_ENV_PATH}; " \
            f"gs_ctl stop -D {self.tar_path}"
        self.LOG.info(stop_cmd)
        stop_msg = self.Primary_User_Node.sh(stop_cmd).result()
        self.LOG.info(stop_msg)

        self.LOG.info('----删除备份文件----')
        is_dir_exists_cmd = f'rm -rf {self.gs_basebackup_bak_path} ' \
            f'{self.tar_path}'
        result = self.Primary_User_Node.sh(is_dir_exists_cmd).result()
        self.LOG.info(result)

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

        self.LOG.info(
            '----Opengauss_Function_Tools_gs_basebackup_Case0014 end----')
