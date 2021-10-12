--  @testpoint:delete语法，alias选项结合where条件测试，符合标识符命名规范，删除成功
--建表
drop table if exists t_delete01;
create table t_delete01(id int,name varchar(10));
--插入数据
insert into t_delete01 (id) values(generate_series(1,100));
--删除表数据，指定alias参数，删除61条数据，别名由为字母、下划线、数字（0-9）或美元符号（$）组成
delete from t_delete01 as t_delete01$ where id > 39;
--再次插入数据
insert into t_delete01 (id) values(generate_series(1,100));
--删除表数据，指定alias参数，别名以_开头，省略as选项，删除78条数据
delete from t_delete01 _delete01$ where id <= 39;
--再次插入数据
insert into t_delete01 (id) values(generate_series(1,100));
--删除表数据，指定alias参数，别名以大写字母开头，删除2条数据
delete from t_delete01 T_delete01$ where id = 100;
--删除表数据，指定alias参数，别名以大写字母开头且添加双引号，不加条件，删除0条数据
delete from t_delete01 "T_delete01$";
--删除表
drop table t_delete01;