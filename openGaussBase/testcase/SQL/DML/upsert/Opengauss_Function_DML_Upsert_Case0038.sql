--  @testpoint:使用insert...update插入两条数据重复数据，添加关键字EXCLUDED,主键和其他列数据均已存在，合理报错
--预置条件enable_upsert_to_merge为off
drop table if exists upsert_a1;
--建表，指定一列是主键
create table upsert1_a1(id int primary key,age int,count int);
--常规插入一条数据
insert into upsert1_a1 values (1,1,1),(4,4,4);
select * from upsert1_a1;
--插入两条数据重复数据，原有数据(1,1,1)更改为(1,2,3)
insert into upsert1_a1 values(1,2,3),(1,2,3) ON DUPLICATE key update age=EXCLUDED.age,count=EXCLUDED.count;
--插入两条不重复数据，原数据(1,2,3)更改为(1,7,8),
insert into upsert1_a1 values(1,5,7),(1,7,8) ON DUPLICATE key update age=EXCLUDED.age,count=EXCLUDED.count;
select * from upsert1_a1;
drop table upsert1_a1;