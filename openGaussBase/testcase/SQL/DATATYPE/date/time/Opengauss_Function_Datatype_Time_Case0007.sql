-- @testpoint: 输入字符串型日期，类型前加time进行转换

DROP TABLE IF EXISTS test_time07;
CREATE TABLE test_time07 (A INT,B time);
INSERT INTO test_time07 VALUES (1,time '11:22:33.456');
INSERT INTO test_time07 VALUES (2,time '23:45:56.789');
SELECT * FROM test_time07;
drop table test_time07;
