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
Case Name   : 用户检查max_process_memory参数设置是否合理（参数i和参数U组合测试）
Description :
    运行openGauss的用户检查指定检查项： gs_check -i CheckMaxProcMemory -U omm并交互输入root权限的用户及其密码
Expect      :
    密码输入正确；检查完成
History     :
"""

import unittest
from yat.test import Node
from yat.test import macro
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger

logger = Logger()

class Tools(unittest.TestCase):
    def setUp(self):
        logger.info('--------------Opengauss_Function_Tools_gs_check_Case0233start-------------------')
        self.dbuserNode = Node('dbuser')
        self.rootNode = Node('default')
        self.Constant = Constant()

    def test_server_tools(self):
        logger.info('------------------运行openGauss的用户检查max_process_memory参数设置是否合理------------------')
        check_cmd1 = f'''
                        source {macro.DB_ENV_PATH}
                        expect <<EOF
                        set timeout -1
                        spawn gs_check -i CheckMaxProcMemory -U {self.dbuserNode.ssh_user}
                        expect "*]:"
                        send "{self.rootNode.ssh_user}\r"
                        expect "*]:"
                        send "{self.rootNode.ssh_password}\r"
                        expect eof
                        '''
        logger.info(check_cmd1)
        msg1 = self.dbuserNode.sh(check_cmd1).result()
        logger.info(msg1)
        flag = (self.Constant.GS_CHECK_SUCCESS_MSG2[0] in msg1 or self.Constant.GS_CHECK_SUCCESS_MSG2[1] in msg1) and \
               self.Constant.GS_CHECK_SUCCESS_MSG2[2] in msg1
        self.assertTrue(flag)

    def tearDown(self):
        logger.info('--------------无需清理环境-------------------')
        logger.info('------------------Opengauss_Function_Tools_gs_check_Case0233finish------------------')
