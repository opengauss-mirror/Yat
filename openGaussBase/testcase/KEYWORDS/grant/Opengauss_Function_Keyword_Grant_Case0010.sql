--  @testpoint:openGauss保留关键字grant同时作为表名和列名带引号，建表成功
drop table if exists "grant";
create table "grant"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"grant" varchar(100) default 'grant'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--查看表数据
select "grant" from "grant";

--清理环境
drop table "grant";