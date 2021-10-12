--  @testpoint:创建主键约束，字段约束方式INITIALLY IMMEDIATE，SET CONSTRAINTS设置约束检查行为

--建表同时定义主键约束
drop table if exists t4;
create table t4 (id int primary key INITIALLY immediate,name varchar(40));
--查看约束名字
select conname,condeferrable,condeferred from pg_constraint where conrelid = (select oid from pg_class where relname='t4');
--插入数据，合理报错
insert into t4 values(3,'a'),(3,'b');
--开启事务
start transaction;
--设置当前事务检查行为的约束条件(设置事务结尾检查，合理报错，主键约束不能延迟检查)
SET CONSTRAINTS t4_pkey DEFERRED;
end;
--删表
drop table t4;