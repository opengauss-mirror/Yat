--  @testpoint:openGauss关键字next(非保留)，同时作为表名和列名带引号，并进行dml操作,next列的值最终显示为1000

drop table if exists "next";
create table "next"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"next" varchar(100) default 'next'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "next"(c_id,"next") values(1,'hello');
insert into "next"(c_id,"next") values(2,'china');
update "next" set "next"=1000 where "next"='hello';
delete from "next" where "next"='china';
select "next" from "next" where "next"!='hello' order by "next";

drop table "next";
