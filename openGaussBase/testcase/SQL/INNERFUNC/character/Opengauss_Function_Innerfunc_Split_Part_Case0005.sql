-- @testpoint: 指定个数为负数，合理报错
DROP TABLE IF EXISTS type_char;
CREATE TABLE type_char (string1 char(100));
insert into type_char values ('abc~@~def~@~ghi');
SELECT split_part(string1,'~@~',-1) from type_char;
DROP TABLE IF EXISTS type_char;