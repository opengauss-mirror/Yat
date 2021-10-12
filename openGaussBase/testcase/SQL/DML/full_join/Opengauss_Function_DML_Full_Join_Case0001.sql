-- @testpoint: 同一个表之间使用full join语句查询
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
--同一个表使用full join连接
select * from all_datatype_table t1 full join all_datatype_table t2 on t1.id=t2.id where t1.id<10;
--删除表
drop table all_datatype_table;
