--  @testpoint:openGauss关键字movement(非保留)，同时作为表名和列名带引号，并进行dml操作,movement列的值最终显示为1000

drop table if exists "movement";
create table "movement"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"movement" varchar(100) default 'movement'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "movement"(c_id,"movement") values(1,'hello');
insert into "movement"(c_id,"movement") values(2,'china');
update "movement" set "movement"=1000 where "movement"='hello';
delete from "movement" where "movement"='china';
select "movement" from "movement" where "movement"!='hello' order by "movement";

drop table "movement";

