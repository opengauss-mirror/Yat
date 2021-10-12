--  @testpoint:openGauss关键字datetime_interval_precision(非保留)，同时作为表名和列名带引号，与union结合查询合并两个SELECT 语句查询

drop table if exists "datetime_interval_precision";
create table "datetime_interval_precision"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"datetime_interval_precision" varchar(100) default 'datetime_interval_precision'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into "datetime_interval_precision"(c_id,"datetime_interval_precision") values(1,'hello');
insert into "datetime_interval_precision"(c_id,"datetime_interval_precision") values(2,'china');
insert into "datetime_interval_precision"(c_id,"datetime_interval_precision") values(3,'gauss');
---两个select语句合并查询，查询结果显示hello、china、gauss，对括号中的select子句取limit 2
select "datetime_interval_precision" from "datetime_interval_precision" where "datetime_interval_precision"='hello'
union all (select "datetime_interval_precision" from "datetime_interval_precision" where "datetime_interval_precision"!='hello' order by "datetime_interval_precision" limit 2);

drop table "datetime_interval_precision";