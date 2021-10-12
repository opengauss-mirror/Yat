--  @testpoint:openGauss关键字exclude(非保留)同时作为表名和列名带引号,并使用该列结合limit排序,exclude列的值按字母大小排序且只显示前2条数据

drop table if exists "exclude";
create table "exclude"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"exclude" varchar(100) default 'exclude'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);
delete from "exclude";
insert into "exclude"(c_id,"exclude") values(1,'hello');
insert into "exclude"(c_id,"exclude") values(2,'china');
insert into "exclude"(c_id,"exclude") values(3,'gauss');
select "exclude" from "exclude" where "exclude"!='hello' order by "exclude" limit 2 ;

drop table "exclude";

