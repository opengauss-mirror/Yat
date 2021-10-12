-- @testpoint: 指定列名，在一条insert语句中插入两列数据
-- @modify at: 2020-11-16
--建表
drop table if exists zsharding_tbl;
create table zsharding_tbl(
c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
c_real real, c_double real,
c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
c_date date, c_datetime date, c_timestamp timestamp
)
PARTITION BY RANGE (c_integer)
(
);
--插入数据
insert into zsharding_tbl(c_id,c_integer) values(1,123);
select * from zsharding_tbl order by 1;
--删表
drop table if exists zsharding_tbl;


