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
Case Type   : 系统内部使用工具
Case Name   : 使用-f指定无权限目录解析dump detail信息
Description :
    1.查看gaussdb进程号
    2.启动trace
    3.去除指定目录权限
    4.将共享内存中的trace信息写入指定文件
Expect      :
    1.查看gaussdb进程号成功
    2.开启trace成功
    3.去除指定目录权限成功
    4.信息写入失败，报错Failed to open trace output file
History     :
"""

import unittest

from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger
from yat.test import Node
from yat.test import macro

LOG = Logger()


class SystemInternalTools(unittest.TestCase):
    def setUp(self):
        LOG.info('-------------------this is setup--------------------')
        LOG.info('---Opengauss_Function_Tools_Gs_Trace0020开始执行-----')
        self.constant = Constant()
        self.PrimaryNode = Node('PrimaryDbUser')
        self.sh_primary = CommonSH('PrimaryDbUser')

    def test_system_internal_tools(self):
        LOG.info('-----------------查看数据库进程号---------------')
        pid_cmd = f"ps -ef | grep {self.PrimaryNode.ssh_user} | " \
            f"grep gaussdb | grep {macro.DB_INSTANCE_PATH} | tr -s ' '" \
            f"| grep -v grep | cut -d ' ' -f 2"
        LOG.info(pid_cmd)
        self.pid_msg = self.PrimaryNode.sh(pid_cmd).result()
        LOG.info('数据库进程为：' + self.pid_msg)

        LOG.info('--------------启动trace------------------')
        start_cmd = f'''source {macro.DB_ENV_PATH};
            gstrace start -p {self.pid_msg};
            '''
        LOG.info(start_cmd)
        start_msg = self.PrimaryNode.sh(start_cmd).result()
        self.assertIn(self.constant.trace_start_success, start_msg)

        LOG.info('--------------创建目录-------------')
        mkdir_cmd = f"mkdir {macro.DB_BACKUP_PATH}/testzz;"
        LOG.info(mkdir_cmd)
        mkdir_msg = self.PrimaryNode.sh(mkdir_cmd).result()
        LOG.info(mkdir_msg)
        self.assertNotIn(self.constant.SQL_WRONG_MSG[1], mkdir_msg)

        LOG.info('--------------去除指定目录权限-------------')
        mkdir_cmd = f" chmod 000 " \
            f"{macro.DB_BACKUP_PATH}/testzz ;"
        LOG.info(mkdir_cmd)
        mkdir_msg = self.PrimaryNode.sh(mkdir_cmd).result()
        LOG.info(mkdir_msg)
        self.assertNotIn(self.constant.SQL_WRONG_MSG[1], mkdir_msg)

        LOG.info('---------将共享内存中的trace信息写入指定文件---------')
        dump_cmd = f'''source {macro.DB_ENV_PATH};
            gstrace dump -p {self.pid_msg} -o \
            {macro.DB_BACKUP_PATH}/testzz/gs_trace.dump ;
            '''
        LOG.info(dump_cmd)
        dump_msg = self.PrimaryNode.sh(dump_cmd).result()
        self.assertIn(self.constant.open_output_file_fail, dump_msg)

    def tearDown(self):
        LOG.info('--------------this is tearDown--------------')
        stop_cmd = f'''source {macro.DB_ENV_PATH};
            gstrace stop -p {self.pid_msg};
            rm -rf {macro.DB_BACKUP_PATH}/testzz;
            '''
        LOG.info(stop_cmd)
        stop_msg = self.PrimaryNode.sh(stop_cmd).result()
        LOG.info(stop_msg)
        LOG.info('---Opengauss_Function_Tools_Gs_Trace0020执行完成---')
