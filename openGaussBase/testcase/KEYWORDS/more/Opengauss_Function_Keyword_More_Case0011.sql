--  @testpoint:openGauss关键字more(非保留)，同时作为表名和列名带引号，并进行dml操作,more列的值最终显示为1000

drop table if exists "more";
create table "more"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"more" varchar(100) default 'more'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "more"(c_id,"more") values(1,'hello');
insert into "more"(c_id,"more") values(2,'china');
update "more" set "more"=1000 where "more"='hello';
delete from "more" where "more"='china';
select "more" from "more" where "more"!='hello' order by "more";

drop table "more";

