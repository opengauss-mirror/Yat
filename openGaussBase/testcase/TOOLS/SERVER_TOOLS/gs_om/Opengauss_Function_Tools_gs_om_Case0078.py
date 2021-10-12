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
Case Type   : 服务端工具
Case Name   : 查询指定服务器状态的详细信息的同时生成日志文件
Description :
    1.查询指定服务器状态的详细信息的同时生成日志文件
    2.查看日志文件是否生成
    3.删除日志文件
Expect      :
    1.查询成功
    2.日志文件生成成功
    3.删除成功
History     :
"""
import unittest
from yat.test import Node
from yat.test import macro
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger
from testcase.utils.CommonSH import CommonSH
Log = Logger()


class Tools(unittest.TestCase):
    def setUp(self):
        Log.info('--Opengauss_Function_Tools_gs_om_Case0078start--')
        self.dbusernode = Node('dbuser')
        self.constant = Constant()
        self.commonsh = CommonSH()

    def test_server_tools1(self):
        Log.info('------查询指定服务器状态的详细信息的同时生成日志文件-------')
        Log.info('-----查看主机名称-----')
        check_cmd = f'hostname'
        Log.info(check_cmd)
        hostname = self.dbusernode.sh(check_cmd).result()
        Log.info(hostname)
        om_cmd1 = f'source {macro.DB_ENV_PATH};' \
            f'gs_om ' \
            f'-t status ' \
            f'-h {hostname} ' \
            f'--detail  ' \
            f'-l {macro.DB_INSTANCE_PATH}/om.log'
        Log.info(om_cmd1)
        om_msg1 = self.dbusernode.sh(om_cmd1).result()
        Log.info(om_msg1)
        self.assertIn('Cluster State', om_msg1)
        self.assertIn('Datanode State', om_msg1)
        Log.info('------查询是否生成日志文件-------')
        du_cmd = f'''du -h {macro.DB_INSTANCE_PATH}/om*.log;'''
        Log.info(du_cmd)
        du_msg = self.dbusernode.sh(du_cmd).result()
        Log.info(du_msg)
        dumsg_list = du_msg.split()[0]
        Log.info(dumsg_list)
        self.assertTrue(float(dumsg_list[:-1]) > 0)

    def tearDown(self):
        Log.info('--------------清理环境-------------------')
        clear_cmd = f'rm -rf {macro.DB_INSTANCE_PATH}/om*.log;'
        Log.info(clear_cmd)
        clear_msg = self.dbusernode.sh(clear_cmd).result()
        Log.info(clear_msg)
        Log.info('--Opengauss_Function_Tools_gs_om_Case0078finish--')
