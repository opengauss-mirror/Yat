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
Case Type   : 列存表支持主键、唯一索引
Case Name   : 创建列存普通表，插入数据，删除唯一索引，再次插入之前已插入数据
Description :
    1、创建普通列存表，字段1添加主键约束，字段2添加唯一约束;
    2、字段3创建唯一索引;
    3、插入数据，数据非空且唯一;
    4、删除唯一索引，再次插入之前已插入数据;
    5、清理环境;
Expect      :
    1、创建普通列存表成功;
    2、创建唯一索引成功;
    3、插入数据成功;
    4、删除索引成功，插入数据成功;
    5、清理环境成功;
History     :
"""

import unittest
from testcase.utils.Logger import Logger
from testcase.utils.CommonSH import CommonSH
from testcase.utils.Constant import Constant


class DdlTestCase(unittest.TestCase):
    def setUp(self):
        self.log = Logger()
        self.comsh = CommonSH('PrimaryDbUser')
        self.constant = Constant()
        self.table_name = 't_unique_index_column_0068'
        self.index_name = 'i_unique_index_column_0068'
        self.log.info('------SetUp:检查数据库状态是否正常------')
        status = self.comsh.get_db_cluster_status()
        self.assertTrue("Degraded" in status or "Normal" in status)

    def test_column_unique_index(self):
        self.log.info('---Opengauss_Function_DDL_Column_Unique_Index_Case0068'
                      '开始执行---')
        text = '----step1 & step2:创建普通列存表，添加主键约束和唯一约束,创建唯一索引; ' \
               'expect:step1 & step2执行成功------'
        self.log.info(text)
        sql_cmd1 = f'''drop table if exists {self.table_name};
            create table {self.table_name}(id1 int,id2 int,id3 int) 
            with(orientation=column);
            create unique index {self.index_name} on {self.table_name} 
            using btree(id1,id2,id3);
            '''
        self.log.info(sql_cmd1)
        sql_res1 = self.comsh.execut_db_sql(sql_cmd1)
        self.log.info(sql_res1)
        self.assertTrue(self.constant.CREATE_TABLE_SUCCESS in sql_res1
                        and self.constant.CREATE_INDEX_SUCCESS in sql_res1,
                        '执行失败' + text)

        self.log.info('------step3:插入数据，数据唯一且非空; expect:成功------')
        sql_cmd2 = f'''insert into {self.table_name} 
            values(generate_series(1,10000),generate_series(1,10000),
            generate_series(1,10000));'''
        self.log.info(sql_cmd2)
        sql_res2 = self.comsh.execut_db_sql(sql_cmd2)
        self.log.info(sql_res2)
        self.assertTrue(self.constant.INSERT_SUCCESS_MSG in sql_res2,
                        '执行失败' + text)

        self.log.info('------step4:删除唯一索引，再次插入之前已插入数据; expect:成功------')
        sql_cmd3 = f'''drop index {self.index_name};
            insert into {self.table_name} values(generate_series(1,10000),
            generate_series(1,10000),generate_series(1,10000));'''
        self.log.info(sql_cmd3)
        sql_res3 = self.comsh.execut_db_sql(sql_cmd3)
        self.log.info(sql_res3)
        self.assertTrue(self.constant.DROP_INDEX_SUCCESS_MSG in sql_res3
                        and self.constant.INSERT_SUCCESS_MSG in sql_res3,
                        '执行失败' + text)

    def tearDown(self):
        self.log.info('------step5:清理环境; expect:成功------')
        drop_cmd = f'''drop table {self.table_name} cascade;'''
        self.log.info(drop_cmd)
        drop_res = self.comsh.execut_db_sql(drop_cmd)
        self.log.info(drop_res)
        self.log.info('---Opengauss_Function_DDL_Column_Unique_Index_Case0068'
                      '执行结束---')
