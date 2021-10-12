--  @testpoint:使用insert...nothing语句，插入两条数据，第一条数据主键列已存在，其他列数据不存在；第二条数据主键列不存在，其他列数据不存在；新增一条数据
--预置条件enable_upsert_to_merge为off
drop table if exists products_c1;
--建表，指定一列是主键
CREATE TABLE products_c1 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products_c1 values(10,'grains',5.5);
select * from  products_c1;
--使用insert...nothing语句,插入一条数据(18,'orange',7.8)成功
insert into products_c1 values(10,'apple',6.8),(18,'orange',7.8) on DUPLICATE key update nothing;
select * from  products_c1;
drop table products_c1;