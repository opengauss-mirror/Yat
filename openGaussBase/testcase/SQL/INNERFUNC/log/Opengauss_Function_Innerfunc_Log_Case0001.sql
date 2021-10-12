-- @testpoint: 使用log函数创建视图
drop view if exists V_LOG;
drop table if exists t_log;
create table t_log(
 c_id integer,
 c_boolean boolean,
 c_integer integer,
 c_bigint bigint,
 c_real real,
 c_decimal decimal(38),
 c_number number(38),
 c_char char(50) default null,
 c_varchar varchar(50),
 c_clob clob,
 c_blob blob,
 c_timestamp timestamp,
 c_interval interval day to second);
insert into t_log(c_boolean) values(true),(false),(10),(0),(null);
insert into t_log(c_timestamp) values(TO_DATE('2018-06-28 13:14:15', 'YYYY-MM-DD HH24:MI:SS')),(TO_DATE('2018-JUN-28 01:14:15', 'YYYY-MON-DD HH:MI:SS')),(null);
insert into t_log(c_interval) values('12 12:3:4.1234'),(null);
create view V_LOG as select log(c_integer) t1 from t_log where c_integer >0;
select t1 from V_LOG order by t1;
drop view if exists V_LOG;
drop table if exists t_log;