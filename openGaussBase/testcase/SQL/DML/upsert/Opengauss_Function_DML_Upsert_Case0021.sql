--  @testpoint:创建表时未设置主键约束，使用insert...update语句，正常插入数据
--预置条件enable_upsert_to_merge为off
drop table if exists products18;
--建表，指定一列是主键
CREATE TABLE products18 (
    product_no integer ,
    name text,
    price numeric
);


--使用insert...update语句插入一条数据，数据插入成功
insert into  products18 values(02,'grains',5.5) on DUPLICATE key update name='grains', price=5.5;
select * from  products18;
drop table products18;