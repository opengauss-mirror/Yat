--  @testpoint:使用insert...nothing语句，插入一条数据，主键列数据已存在，其他列数据不存在
--预置条件enable_upsert_to_merge为off
drop table if exists products21;
--建表，指定一列是主键
CREATE TABLE products21 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products21 values(10,'grains',5.5);
select * from  products21;
--使用insert...nothing语句,主键列已存在，不做任何处理，直接返回，原数据不变
insert into products21 values(10,'apple',6.8) on DUPLICATE key update nothing;
select * from  products21;
drop table products21;