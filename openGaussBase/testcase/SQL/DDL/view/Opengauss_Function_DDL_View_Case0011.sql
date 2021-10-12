-- @testpoint: 创建视图,为视图指定一个可选的参数,参数不合法，合理报错
--建表
drop table if exists table_view_011;
create table table_view_011(id int,name varchar(20));
--插入数据
insert into table_view_011 values(1,'hello'),(2,'world');
--创建视图，报错
drop view if exists temp_view_011;
create view temp_view_011(id) with($#@security_barrier = true) as select * from table_view_011;
create or replace view temp_view_011(id) with("参数$#@security_barrier" = true) as select * from table_view_011;
--删表
drop table table_view_011;
