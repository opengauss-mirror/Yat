-- @testpoint: 测试update支持修改多个值，修改成功
--建表1
drop table if exists all_datatype_tbl;
create table all_datatype_tbl(c1 integer,c2 integer,c3 integer,c4 integer,c5 integer,c6 integer,c7 integer,c8 integer,c9 integer,c10 integer,c11 integer,c12 integer,c13 integer,
c14 integer,c15 integer,c16 integer,c17 integer,c18 integer,c19 integer,c20 integer);
--插入数据
insert into all_datatype_tbl values(1,2,3,4,5,6,7,8,9,10,21,22,23,24,25,26,27,28,29,30);
--修改数据
update all_datatype_tbl set (c1,c2,c3,c4,c5) = (select c16,c17,c18,c19,c20 from all_datatype_tbl);
--建表2
drop table if exists all_datatype_tb2;
create table all_datatype_tb2(c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int,c8 int,c9 int,c10 int);
--插入数据
select * from all_datatype_tb2;
--修改数据
update all_datatype_tbl set (c1,c2,c3,c4,c5) = (select c6,c7,c8,c9,c10 from all_datatype_tb2);
select * from all_datatype_tbl;
--删表
drop table all_datatype_tbl;
drop table all_datatype_tb2;

