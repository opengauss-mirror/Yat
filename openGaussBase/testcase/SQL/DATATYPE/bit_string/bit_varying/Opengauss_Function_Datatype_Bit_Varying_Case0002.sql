-- @testpoint: 插入超出设定范围值，合理报错
-- @modify at: 2020-11-04

--创建表
DROP TABLE IF EXISTS type_bit_varying02;
CREATE TABLE type_bit_varying02 (name bit varying(3));

--插入数据，超出字段设定长度
insert into type_bit_varying02 values (B'1011');

--插入失败，查看数据
select * from type_bit_varying02;

--清理数据
drop table type_bit_varying02;