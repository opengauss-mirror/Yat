-- @testpoint: _和%的使用
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (string1 char(100));
insert into type_char values ('AA@_BBCC');
SELECT  (string1 LIKE '%A@_B%') from type_char AS RESULT;
DROP TABLE IF EXISTS type_char;