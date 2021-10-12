--  @testpoint:openGauss关键字current(非保留)，同时作为表名和列名带引号，并进行dml操作,current列的值最终显示为1000

drop table if exists "current";
create table "current"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"current" varchar(100) default 'current'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "current"(c_id,"current") values(1,'hello');
insert into "current"(c_id,"current") values(2,'china');
update "current" set "current"=1000 where "current"='hello';
delete from "current" where "current"='china';
select "current" from "current" where "current"!='hello' order by "current";

drop table "current";
