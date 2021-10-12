-- @testpoint:使用join...on语句，on后面的条件数据类型不匹配，合理报错
-- @modify at: 2020-11-13
--建表
drop table if exists all_datatype_table;
create table all_datatype_table(id int not null,c_intger integer,c_char char(10))
PARTITION BY RANGE (c_intger)
(
partition P_max values less than (2050)
);
--插入数据
insert into all_datatype_table values(1,1000,1000);
insert into all_datatype_table values(2,2000,1000);
insert into all_datatype_table values(3,2001,null);
insert into all_datatype_table values(4,2002,'a');
--查询表
select * from all_datatype_table t1 join all_datatype_table t2 on t1.c_intger=t2.c_char order by 1,2,3,4,5,6;
--删表
drop table if exists all_datatype_table;
