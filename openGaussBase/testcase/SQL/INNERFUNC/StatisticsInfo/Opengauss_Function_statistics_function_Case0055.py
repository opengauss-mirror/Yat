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
Case Type   : 统计信息函数
Case Name   : pg_stat_get_redo_stat()描述：用于统计会话线程日志回放情况。
Description :
    1.统计会话线程日志回放情况
Expect      :
    1.统计会话线程日志回放情况成功
History     :
"""

import unittest
from yat.test import Node
from testcase.utils.CommonSH import CommonSH
from testcase.utils.Logger import Logger


class Tools(unittest.TestCase):
    def setUp(self):
        self.log = Logger()
        self.log.info('Opengauss_Function_statistics_function_Case0055开始')
        self.dbuser = Node('dbuser')
        self.commonsh = CommonSH()

    def test_built_in_func(self):
        self.log.info('-----步骤1.统计会话线程日志回放情况-----')
        sql_cmd = self.commonsh.execut_db_sql(
            f'select pg_stat_get_redo_stat();')
        self.log.info(sql_cmd)
        number = len(sql_cmd.splitlines())
        self.log.info(number)
        if number >= 3:
            str_info = sql_cmd.split('\n')[-2]
            self.log.info(str_info)
            num = len(str_info.split(','))
            self.log.info(f'num = {num}')
            if num == 7:
                self.log.info('统计会话线程日志回放情况成功')
            else:
                raise Exception('函数执行异常，请检查')
        else:
            raise Exception('执行结果异常，请检查')

    def tearDown(self):
        self.log.info('Opengauss_Function_statistics_function_Case0055结束')
