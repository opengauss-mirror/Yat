-- @testpoint: 数字操作符&(二进制AND), 入参有算数表达式
drop table if exists data_01;
create table data_01 (clo1 float,clo2 float);
insert into data_01 values (1.25, 2.45);
select (clo1 +1) & clo2 from data_01;
SELECT (1.26 * 2) & -15  AS RESULT;
SELECT 8.81 & (0 + 2) AS RESULT;
drop table if exists data_01;