--  @testpoint:delete语法中，WHERE condition使用子查询
drop table if exists t_delete05;
create table t_delete05(age int,salary numeric);
--插入数据
insert into t_delete05 values(25,8500);
insert into t_delete05 values(30,9500.50);
insert into t_delete05 values(45,6000);
--使用delete语句，where条件中使用子查询，删除2条数据
delete FROM t_delete05 WHERE age in (SELECT AGE FROM t_delete05 WHERE SALARY > 6500);
--删除表
drop table t_delete05;