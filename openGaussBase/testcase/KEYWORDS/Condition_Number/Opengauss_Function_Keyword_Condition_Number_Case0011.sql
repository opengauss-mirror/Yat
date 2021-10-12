--  @testpoint:openGauss关键字condition_number(非保留)，同时作为表名和列名带引号，并进行dml操作,condition_number列的值最终显示为1000

drop table if exists "condition_number";
create table "condition_number"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"condition_number" varchar(100) default 'condition_number'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "condition_number"(c_id,"condition_number") values(1,'hello');
insert into "condition_number"(c_id,"condition_number") values(2,'china');
update "condition_number" set "condition_number"=1000 where "condition_number"='hello';
delete from "condition_number" where "condition_number"='china';
select "condition_number" from "condition_number" where "condition_number"!='hello' order by "condition_number";

drop table "condition_number";

