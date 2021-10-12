--  @testpoint:没有主键约束的表使用insert..nothing语句，插入一条数据成功
--预置条件enable_upsert_to_merge为off
drop table if exists products_c9;
--建表，指定一列是主键
CREATE TABLE products_c9 (
    product_no integer,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products_c9 values(10,'grains',5.5);
select * from  products_c9;
--使用insert...nothing语句，主键不重复，其他列数据不重复，新增一条数据(9,'veggies2',6.88)
insert into  products_c9 values (9,'veggies2',6.88) on DUPLICATE key update nothing;
select * from  products_c9;
drop table products_c9;