-- @testpoint: 创建临时表，字段名有汉字和特殊字符，合理报错
-- @modify at: 2020-11-24
drop table if exists temp_table_043;
create  temporary table temp_table_043(万@#'' int);


