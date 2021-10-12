--  @testpoint:创建唯一约束，字段约束方式DEFERRABLE INITIALLY DEFERRED，SET CONSTRAINTS设置约束检查行为

--建表同时定义唯一约束
drop table if exists t4;
create table t4 (id int unique INITIALLY DEFERRED,name varchar(40));
--查看约束名字
select conname,condeferrable,condeferred from pg_constraint where conrelid = (select oid from pg_class where relname='t4');
--插入数据
insert into t4 values(3,'a'),(4,'b');
--开启事务
start transaction;
--设置当前事务检查行为的约束条件(建表设置约束为事务结尾检查，使用set命令每条语句后进行检查)
SET CONSTRAINTS t4_id_key immediate;
--插入数据（set命令生效，合理报错）
insert into t4 values(4,'a'),(5,'b');
--提交事务
commit;
--查询表数据(只有原有两条数据)
select * from t4;
--删表
drop table t4;