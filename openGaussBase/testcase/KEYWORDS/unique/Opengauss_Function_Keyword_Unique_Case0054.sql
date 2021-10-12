-- @testpoint: unique与offset结合使用
drop table if exists "unique";
create table "unique"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"unique" varchar(100)  default 'unique',
	"offset" int
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);
insert into "unique"(c_id,"unique","offset") values(1,'world',100);
insert into "unique"(c_id,"unique","offset") values(2,'china',200);
insert into "unique"(c_id,"unique","offset") values(3,'xian',300);
insert into "unique"(c_id,"unique","offset") values(4,'shanghai',400);
select "unique","offset" from "unique" where "unique"!='world' order by "unique","offset" offset 1;

--清理环境
drop table if exists "unique";