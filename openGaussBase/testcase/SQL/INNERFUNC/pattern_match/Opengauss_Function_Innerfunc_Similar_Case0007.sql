-- @testpoint: 模式匹配操作符SIMILAR TO,使用元字符|，匹配两个多字符之一
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (string1 varchar(10));
insert into type_char values ('abcd');
SELECT  * from type_char  where string1 SIMILAR TO '%b(cd|cb)';
DROP TABLE IF EXISTS type_char;