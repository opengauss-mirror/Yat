-- @testpoint: 列名有特殊字符合理报错

DROP TABLE IF EXISTS AABBB63;
CREATE TABLE AABBB63(BBA@AAAAAAAAAAAAAA！AAAAAAAAAAAAAAAA#AAAAAAAAAAA好AAAAAABBB63 CHAR(20) PRIMARY KEY,ID int);
INSERT INTO AABBB63 VALUES('2012-07-12',789);
INSERT INTO AABBB63 VALUES('2013-07-12',852);
INSERT INTO AABBB63 VALUES('2014-07-12',453);
SELECT * FROM AABBB63 order by  BBA@AAAAAAAAAAAAAA！AAAAAAAAAAAAAAAA#AAAAAAAAAAA好AAAAAABBB63  DESC;
DROP TABLE IF EXISTS AABBB63;