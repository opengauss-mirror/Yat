--  @testpoint:openGauss关键字current_path(非保留)，同时作为表名和列名带引号，并进行dml操作,current_path列的值最终显示为1000

drop table if exists "current_path";
create table "current_path"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"current_path" varchar(100) default 'current_path'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "current_path"(c_id,"current_path") values(1,'hello');
insert into "current_path"(c_id,"current_path") values(2,'china');
update "current_path" set "current_path"=1000 where "current_path"='hello';
delete from "current_path" where "current_path"='china';
select "current_path" from "current_path" where "current_path"!='hello' order by "current_path";

drop table "current_path";

