--  @testpoint:openGauss关键字reloptions(非保留)，作为列名带引号并且删除时使用该列,建表成功，reloptions列值是'hello'的删除成功

drop table if exists reloptions_test;
create table reloptions_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"reloptions" varchar(100) default 'reloptions'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into reloptions_test(c_id,"reloptions") values(1,'hello');
insert into reloptions_test(c_id) values(2);
delete from reloptions_test where "reloptions"='hello';
select * from reloptions_test order by "reloptions";
drop table reloptions_test;


