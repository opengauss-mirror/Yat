-- @testpoint: 不带精度n，默认精度为1，插入精度为1的字符
drop table if exists char_type_t1;
CREATE TABLE char_type_t1(CT_COL1 CHARACTER);
insert into char_type_t1 (CT_COL1) values('h');
drop table if exists char_type_t1;