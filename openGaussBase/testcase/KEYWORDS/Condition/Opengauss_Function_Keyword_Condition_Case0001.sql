-- @testpoint: openGauss关键字Condition(非保留),作为列名不带双引号，Condition大小写混合，建表成功

drop table if exists Condition_test;
create table Condition_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	Condition text
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);
--openGauss关键字condition(非保留),作为列名不带双引号，condition大小匹配，建表成功
drop table if exists condition_test;
create table condition_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	condition text
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);
drop table if exists Condition_test;
drop table if exists condition_test;