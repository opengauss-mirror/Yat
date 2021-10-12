--  @testpoint:openGauss关键字pli(非保留)，同时作为表名和列名带引号，并进行dml操作,pli列的值最终显示为1000

drop table if exists "pli";
create table "pli"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"pli" varchar(100) default 'pli'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "pli"(c_id,"pli") values(1,'hello');
insert into "pli"(c_id,"pli") values(2,'china');
update "pli" set "pli"=1000 where "pli"='hello';
delete from "pli" where "pli"='china';
select "pli" from "pli" where "pli"!='hello' order by "pli";

drop table "pli";

