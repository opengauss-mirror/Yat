-- @testpoint: 参数i缺省时时大小写匹配
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (string1 char(100));
insert into type_char values ('ABC');
SELECT regexp_like(string1,'[A-Z]') from type_char;
DROP TABLE IF EXISTS type_char;