--  @testpoint:openGauss关键字Descriptor(非保留),作为列名带双引号，Descriptor大小写混合，建表成功

drop table if exists Descriptor_test;
create table Descriptor_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Descriptor" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Descriptor_test;
drop table Descriptor_test;

--openGauss关键字descriptor(非保留),作为列名带双引号，descriptor大小写匹配，建表成功
drop table if exists Descriptor_test;
create table Descriptor_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"descriptor" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from Descriptor_test;
drop table Descriptor_test;