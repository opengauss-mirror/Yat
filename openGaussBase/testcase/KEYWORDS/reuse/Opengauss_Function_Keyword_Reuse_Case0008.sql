--  @testpoint:openGauss关键字reuse(非保留)，作为列名带引号并且删除时使用该列,建表成功，reuse列值是'hello'的删除成功
--创建表
drop table if exists reuse_test;
create table reuse_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer, 
	c_real real, c_double real, 
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38), 
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"reuse" varchar(100) default 'reuse'
) 
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--向表中插入数据
insert into reuse_test(c_id,"reuse") values(1,'hello');

--查询表内容
select * from reuse_test;

--向表中插入数据
insert into reuse_test(c_id) values(2);

--删除表数据
delete from reuse_test where "reuse"='hello';

--查询表内容
select * from reuse_test order by "reuse";

--清理环境
drop table reuse_test;