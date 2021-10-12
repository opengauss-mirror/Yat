--  @testpoint:openGauss关键字privilege(非保留,作为列名带双引号，privilege大小写混合，建表成功

drop table if exists privilege_test;
create table privilege_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Privilege" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from privilege_test;
drop table privilege_test;

--openGauss关键字privilege(非保留,作为列名带双引号，privilege大小写匹配，建表成功
drop table if exists privilege_test;
create table privilege_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"privilege" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from privilege_test;
drop table privilege_test;