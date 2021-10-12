--  @testpoint:使用insert...nothing语句，插入两条数据，第一条数据主键列不存在，其他列数据已存在；第二条数据主键列不存在，其他列数据已存在；新增两条数据
--预置条件enable_upsert_to_merge为off
drop table if exists products_c2;
--建表，指定一列是主键
CREATE TABLE products_c2 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products_c2 values(10,'grains',5.5);
select * from  products_c2;
--使用insert...nothing语句,插入两条数据(16,'grains',5.5),(19,'grains',5.5)成功
insert into products_c2 values(16,'grains',5.5),(19,'grains',5.5) on DUPLICATE key update nothing;
select * from  products_c2;
--两条数据主键都重复，直接返回
insert into products_c2 values(16,'grains1',5.5),(16,'grains2',5.5) on DUPLICATE key update nothing;
drop table products_c2;