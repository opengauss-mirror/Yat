--  @testpoint:openGauss关键字nulls(非保留)，同时作为表名和列名带引号，并进行dml操作,nulls列的值最终显示为1000

drop table if exists "nulls";
create table "nulls"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"nulls" varchar(100) default 'nulls'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "nulls"(c_id,"nulls") values(1,'hello');
insert into "nulls"(c_id,"nulls") values(2,'china');
update "nulls" set "nulls"=1000 where "nulls"='hello';
delete from "nulls" where "nulls"='china';
select "nulls" from "nulls" where "nulls"!='hello' order by "nulls";

drop table "nulls";

