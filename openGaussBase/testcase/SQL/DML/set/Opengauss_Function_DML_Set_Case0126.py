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
'''
--  @date:2020/11/10
--  @testpoint:使用show参数显示当前运行时参数的数值
'''
import sys
import unittest
sys.path.append(sys.path[0]+"/../")
from testcase.utils.Logger import Logger
from testcase.utils.Constant import Constant
from testcase.utils.CommonSH import CommonSH


logger = Logger()
commonsh = CommonSH('dbuser')
constant = Constant()

class SYS_Operation(unittest.TestCase):
    def setUp(self):
        logger.info('------------------------Opengauss_Function_DML_Set_Case0126开始执行-----------------------------')

    def test_reset(self):
        sql_cmd1 = commonsh.execut_db_sql('''show CURRENT_SCHEMA;
                                       show TIME ZONE;
                                       show TRANSACTION ISOLATION LEVEL;
                                       show SESSION AUTHORIZATION;
                                       show all;''')
        logger.info(sql_cmd1)
        self.assertIn('"$user",public', sql_cmd1)
        self.assertIn('PRC', sql_cmd1)
        self.assertIn('read committed', sql_cmd1)

    # 清理环境：no need to clean
    def tearDown(self):
        logger.info('----------this is teardown-------')
        logger.info('------------------------Opengauss_Function_DML_Set_Case0126执行结束--------------------------')
