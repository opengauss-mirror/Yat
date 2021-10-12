--  @testpoint:openGauss保留关键字trailing作为列名带引号并且删除时使用该列,建表成功，trailing列值是'hello'的删除成功
drop table if exists trailing_test;
create table trailing_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"trailing" varchar(100) default 'trailing'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into trailing_test(c_id,"trailing") values(1,'hello');
insert into trailing_test(c_id) values(2);
delete from trailing_test where "trailing"='hello';
select * from trailing_test order by "trailing";
drop table trailing_test;


