--  @testpoint:使用insert...update语句插入一条数据,主键列数据已存在，其他列数据不存在，update主键列的值，合理报错
----预置条件enable_upsert_to_merge为off
drop table if exists products8;
--建表，指定一列是主键
CREATE TABLE products8 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规insert插入一条数据
insert into  products8 values(01,'grains',5.5);
select * from  products8;
--使用insert...update插入一条数据，主键重复，update product_no 列
insert into  products8 values(01,'veggies',6.8) on DUPLICATE key update product_no=01;
select * from  products8;
drop table products8;