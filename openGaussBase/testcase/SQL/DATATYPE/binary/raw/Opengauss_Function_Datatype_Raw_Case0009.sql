-- @testpoint: 插入空值
-- @modify at: 2020-11-04

--创建表
DROP TABLE IF EXISTS test_raw09;
CREATE TABLE test_raw09 (name raw);

--插入数据
INSERT INTO test_raw09 VALUES (null);

--插入成功，查看数据
select * from test_raw09;

--清理数据
DROP TABLE test_raw09;