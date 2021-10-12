-- @testpoint: 模式匹配操作符LIKE,使用~~匹配，等效于LIKE
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (string1 varchar(100));
insert into type_char values ('abc');
SELECT * from type_char  where string1 ~~ 'abc';
SELECT * from type_char  where string1 ~~ 'Abc';
DROP TABLE IF EXISTS type_char;