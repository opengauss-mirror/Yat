--  @testpoint:openGauss关键字specific(非保留)，同时作为表名和列名带引号，并进行dml操作,specific列的值最终显示为1000

drop table if exists "specific" CASCADE;
create table "specific"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"specific" varchar(100) default 'specific'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "specific"(c_id,"specific") values(1,'hello');
insert into "specific"(c_id,"specific") values(2,'china');
update "specific" set "specific"=1000 where "specific"='hello';
delete from "specific" where "specific"='china';
select "specific" from "specific" where "specific"!='hello' order by "specific";

drop table "specific";
