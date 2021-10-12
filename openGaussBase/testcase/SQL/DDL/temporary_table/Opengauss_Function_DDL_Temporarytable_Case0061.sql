-- @testpoint: 使用with子句查询临时表
-- @modify at: 2020-11-24
--建表
drop table if exists temp_table_061;
create global TEMPORARY table temp_table_061(a int,b char(2));
insert into temp_table_061 values(1,'a');
--查询
with
sql1 as (select to_char(a) s_name from temp_table_061),
sql2 as (select to_char(b) s_name from temp_table_061 where not exists (select s_name from sql1 limit 1))
select * from sql1
union all
select * from sql2
union all
select 'no records' from sys_dummy
where not exists (select s_name from sql1 limit 1)
and not exists (select s_name from sql2 limit 1) order by 1;
--删表
drop table if exists temp_table_061;