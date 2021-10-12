--  @testpoint:openGauss关键字Distribute(非保留),作为列名带双引号，Distribute大小写混合，建表成功

drop table if exists Distribute_test;
create table Distribute_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Distribute" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Distribute_test;
drop table Distribute_test;

--openGauss关键字distribute(非保留),作为列名带双引号，distribute大小写匹配，建表成功
drop table if exists Distribute_test;
create table Distribute_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"distribute" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Distribute_test;
drop table Distribute_test;