--  @testpoint:openGauss关键字dispatch(非保留)，同时作为表名和列名带引号，并进行dml操作,dispatch列的值最终显示为1000

drop table if exists "dispatch";
create table "dispatch"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"dispatch" varchar(100) default 'dispatch'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "dispatch"(c_id,"dispatch") values(1,'hello');
insert into "dispatch"(c_id,"dispatch") values(2,'china');
update "dispatch" set "dispatch"=1000 where "dispatch"='hello';
delete from "dispatch" where "dispatch"='china';
select "dispatch" from "dispatch" where "dispatch"!='hello' order by "dispatch";

drop table "dispatch";
