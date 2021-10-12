--  @testpoint:使用insert...update语句插入一条数据，添加EXCLUDED关键字，主键列数据不存在，其他列数据已存在，新插入一条数据成功
--预置条件enable_upsert_to_merge为off
drop table if exists products29;
--建表，指定一列是主键
CREATE TABLE products29 (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
--常规插入一条数据
insert into  products29 values(10,'grains',5.5);
select * from  products29;
--添加EXCLUDED关键字,主键不重复，update name列，新插入一条数据成功
insert into  products29 values(11,'grains',5.5) on DUPLICATE key update  name =EXCLUDED.name;
select * from  products29;
drop table products29;