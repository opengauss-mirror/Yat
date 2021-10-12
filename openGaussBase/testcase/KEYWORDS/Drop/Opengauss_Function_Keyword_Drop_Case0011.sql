--  @testpoint:openGauss关键字drop(非保留)，同时作为表名和列名带引号，并进行dml操作,drop列的值最终显示为1000

drop table if exists "drop";
create table "drop"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"drop" varchar(100) default 'drop'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "drop"(c_id,"drop") values(1,'hello');
insert into "drop"(c_id,"drop") values(2,'china');
update "drop" set "drop"=1000 where "drop"='hello';
delete from "drop" where "drop"='china';
select "drop" from "drop" where "drop"!='hello' order by "drop";

drop table "drop";
