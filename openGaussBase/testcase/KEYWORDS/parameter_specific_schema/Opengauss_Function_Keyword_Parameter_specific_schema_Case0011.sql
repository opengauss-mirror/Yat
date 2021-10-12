--  @testpoint:openGauss关键字parameter_specific_schema(非保留)，同时作为表名和列名带引号，并进行dml操作,parameter_specific_schema列的值最终显示为1000

drop table if exists "parameter_specific_schema";
create table "parameter_specific_schema"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"parameter_specific_schema" varchar(100) default 'parameter_specific_schema'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "parameter_specific_schema"(c_id,"parameter_specific_schema") values(1,'hello');
insert into "parameter_specific_schema"(c_id,"parameter_specific_schema") values(2,'china');
update "parameter_specific_schema" set "parameter_specific_schema"=1000 where "parameter_specific_schema"='hello';
delete from "parameter_specific_schema" where "parameter_specific_schema"='china';
select "parameter_specific_schema" from "parameter_specific_schema" where "parameter_specific_schema"!='hello' order by "parameter_specific_schema";

drop table "parameter_specific_schema";

