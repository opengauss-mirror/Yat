--  @testpoint:使用insert...nothing语句，插入两条相同数据,主键列和其他列数据已存在，数据未做任何改变，直接返回
--预置条件enable_upsert_to_merge为off
drop table if exists products_c3;
--建表，指定一列是主键
CREATE TABLE products_c3 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products_c3 values(10,'grains',5.5);
select * from  products_c3;
--使用insert...nothing语句,插入两条数据，直接返回
insert into products_c3 values(10,'grains',5.5),(10,'grains',5.5) on DUPLICATE key update nothing;
select * from  products_c3;
drop table products_c3;