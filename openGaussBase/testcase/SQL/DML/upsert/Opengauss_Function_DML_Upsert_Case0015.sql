--  @testpoint:使用insert...update插入两条重复数据，
--预置条件enable_upsert_to_merge为off
drop table if exists upsert1;
--建表，指定一列是主键
create table upsert1(id int primary key,age int,count int);
--常规insert插入一条数据
insert into upsert1 values (1,1,1),(4,4,4);
select * from upsert1;
--插入两条重复数据,第一条数据更新为(1,2,3)
insert into upsert1 values(1,2,3),(1,2,3) ON DUPLICATE key update  age=2,count=3;
drop table upsert1;
