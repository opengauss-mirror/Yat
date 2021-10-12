--  @testpoint:使用insert...nothing语句，插入一条数据，主键列数据不存在，其他列数据不存在，新插入一条数据成功
--预置条件enable_upsert_to_merge为off
drop table if exists products_a5;
--建表，指定一列是主键
CREATE TABLE products_a5 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products_a5 values(10,'grains',5.5);
select * from  products_a5;
--使用insert...nothing语句,主键列不存在，新插入一条数据(11,'apple',6.8)
insert into products_a5 values(11,'apple',6.8) on DUPLICATE key update nothing;
select * from  products_a5;
drop table products_a5;