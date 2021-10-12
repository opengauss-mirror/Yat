-- @testpoint: 插入空值，合理报错
-- @modify at: 2020-11-04

--创建表
DROP TABLE IF EXISTS type_bit04;
CREATE TABLE type_bit04 (name bit(3));

--插入数据
insert into type_bit04 values (B'');
insert into type_bit04 values (B'null');

--插入失败，查看数据
select * from type_bit04;

--清理环境
drop table type_bit04;