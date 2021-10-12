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
Case Type   : Separation_permission
Case Name   : 支持EXECUTE权限赋予
Description :
    1.初始用户执行：create user wf with password 'Qazwsx@123';
                DROP FUNCTION IF EXISTS func_add_sql() CASCADE;
                CREATE FUNCTION func_add_sql(integer, integer) RETURNS integer
                 AS 'select $1 + $2' LANGUAGE SQL
                IMMUTABLE RETURNS NULL ON NULL INPUT;
                GRANT EXECUTE ON FUNCTION func_add_sql(integer, integer) TO wf;
    2.wf用户执行：call func_add_sql(3,5);
Expect      :
    1.CREATE ROLE
    DROIP
    CREATE FUNCTION
    GRANT
    2.调用成功，返回值8
History     :
"""

import unittest
from yat.test import Node
from yat.test import macro

from testcase.utils.CommonSH import *
from testcase.utils.Constant import Constant
from testcase.utils.Logger import Logger

logger = Logger()


class Privategrant(unittest.TestCase):
    def setUp(self):
        logger.info(
            '-----Opengauss_Function_Security_Permission_Case0010 start-----')
        self.userNode = Node('PrimaryDbUser')
        self.DB_ENV_PATH = macro.DB_ENV_PATH
        self.DB_INSTANCE_PATH = macro.DB_INSTANCE_PATH
        self.sh_primy = CommonSH('PrimaryDbUser')
        self.Constant = Constant()

    def test_default_permission(self):
        logger.info('----------create user || table---------')
        sql_cmd1 = f'create user wf with password \'{macro.COMMON_PASSWD}\';' \
                   f'create database wf_db;' \
                   f'grant connect on database wf_db to wf;'
        msg1 = self.sh_primy.execut_db_sql(sql_cmd1)
        logger.info(msg1)
        self.assertIn(self.Constant.GRANT_SUCCESS_MSG, msg1)
        sql_cmd2 = 'create table security_table (col_1 int,col_2 int);'
        excute_cmd2 = f'source {self.DB_ENV_PATH};' \
                      f'gsql -d wf_db -p {self.userNode.db_port} -U  wf' \
                      f' -W \'{macro.COMMON_PASSWD}\' -c "{sql_cmd2}"'
        logger.info(excute_cmd2)
        msg2 = self.userNode.sh(excute_cmd2).result()
        logger.info(msg2)
        self.assertIn(self.Constant.PERMISSION_DENIED, msg2)

    def tearDown(self):
        sql_cmd1 = 'drop database wf_db;' \
                   'drop table if exists security_table;' \
                   'drop user if exists wf cascade;'
        msg1 = self.sh_primy.execut_db_sql(sql_cmd1)
        logger.info(msg1)
        logger.info(
            '----Opengauss_Function_Security_Permission_Case0010 finish----')
