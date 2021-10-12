--  @testpoint:openGauss关键字escape(非保留)，作为列名带引号并且删除时使用该列,建表成功，escape列值是'hello'的删除成功

drop table if exists escape_test;
create table escape_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"escape" varchar(100) default 'escape'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into escape_test(c_id,"escape") values(1,'hello');
insert into escape_test(c_id) values(2);
delete from escape_test where "escape"='hello';
select * from escape_test order by "escape";
drop table escape_test;

