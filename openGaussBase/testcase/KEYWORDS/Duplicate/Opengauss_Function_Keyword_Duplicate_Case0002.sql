--  @testpoint:openGauss关键字Duplicate(非保留),作为列名带双引号，Duplicate大小写混合，建表成功

drop table if exists Duplicate_test;
create table Duplicate_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Duplicate" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Duplicate_test;
drop table Duplicate_test;

--openGauss关键字duplicate(非保留),作为列名带双引号，duplicate大小写匹配，建表成功
drop table if exists Duplicate_test;
create table Duplicate_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"duplicate" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Duplicate_test;
drop table Duplicate_test;