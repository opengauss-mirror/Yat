-- @testpoint: 定义min为表名和列名
drop table if exists min;
create table min(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	min text
)
PARTITION BY RANGE (c_integer)
(
	partition P_min values less than (maxvalue)
);
--清理环境
drop table if exists min;