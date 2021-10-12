--  @testpoint:openGauss关键字result(非保留)，作为列名带引号并且删除时使用该列,建表成功，result列值是'hello'的删除成功

drop table if exists result_test;
create table result_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"result" varchar(100) default 'result'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into result_test(c_id,"result") values(1,'hello');
insert into result_test(c_id) values(2);
delete from result_test where "result"='hello';
select * from result_test order by "result";
drop table result_test;

