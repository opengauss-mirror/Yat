-- @testpoint: rawtohex函数作为delete的条件使用
DROP TABLE IF EXISTS test_tb_rawtohex;
CREATE TABLE test_tb_rawtohex(hex1 INT,B varchar2(20));
delete from test_tb_rawtohex where rawtohex(hex1)='0';
delete from test_tb_rawtohex where hex1=rawtohex('f6');
delete from test_tb_rawtohex where rawtohex(hex1)=rawtohex('aaa');
DROP TABLE IF EXISTS test_tb_rawtohex;