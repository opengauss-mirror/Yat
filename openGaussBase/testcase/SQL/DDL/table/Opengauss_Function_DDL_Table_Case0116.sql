-- @testpoint: 创建列类型是序列整型SERIAL的表，超出边界时合理报错
drop table if exists table_1;
create table table_1(a SERIAL);
insert into table_1 values(1);
--ERROR:  integer out of range
insert into table_1 values(0);
select * from table_1;
drop table if exists table_1;
