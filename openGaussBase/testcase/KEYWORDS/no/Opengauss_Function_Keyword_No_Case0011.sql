--  @testpoint:openGauss关键字no(非保留)，同时作为表名和列名带引号，并进行dml操作,no列的值最终显示为1000

drop table if exists "no";
create table "no"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"no" varchar(100) default 'no'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "no"(c_id,"no") values(1,'hello');
insert into "no"(c_id,"no") values(2,'china');
update "no" set "no"=1000 where "no"='hello';
delete from "no" where "no"='china';
select "no" from "no" where "no"!='hello' order by "no";

drop table "no";
