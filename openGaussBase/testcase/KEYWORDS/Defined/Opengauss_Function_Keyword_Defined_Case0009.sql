--  @testpoint:openGauss关键字defined(非保留)，作为列名带引号并且排序时使用该列,建表成功，defined列按字母大小排序

drop table if exists defined_test;
create table defined_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"defined" varchar(100) default 'defined'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into defined_test(c_id,"defined") values(1,'hello');
select * from defined_test order by "defined";
drop table defined_test;

