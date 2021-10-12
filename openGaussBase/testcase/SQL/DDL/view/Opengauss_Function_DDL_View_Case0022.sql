-- @testpoint: 设置视图列的默认值，视图名不存在，省略if exists选项，合理报错
--建表
drop table if exists table_view_022;
create table table_view_022(id int,name varchar(20));
--插入数据
insert into table_view_022 values(1,'hello'),(2,'world');
--创建视图
drop view if exists temp_view_022 cascade;
create view temp_view_022 as select * from table_view_022;
--给视图id列设置默认值，不会报错
alter view if exists temp_view_022regfdgdfhbfd alter column id set default 5;
--给视图id列设置默认值，报错
alter view temp_view_022regfdgdfhbfd alter column id set default 5;
--删表
drop table table_view_022 cascade;