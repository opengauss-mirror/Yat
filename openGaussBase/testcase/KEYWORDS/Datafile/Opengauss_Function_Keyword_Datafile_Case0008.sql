--  @testpoint:openGauss关键字datafile(非保留)，作为列名带引号并且删除时使用该列,建表成功，datafile列值是'hello'的删除成功

drop table if exists datafile_test;
create table datafile_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"datafile" varchar(100) default 'datafile'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into datafile_test(c_id,"datafile") values(1,'hello');
insert into datafile_test(c_id) values(2);
delete from datafile_test where "datafile"='hello';
select * from datafile_test order by "datafile";
drop table datafile_test;


