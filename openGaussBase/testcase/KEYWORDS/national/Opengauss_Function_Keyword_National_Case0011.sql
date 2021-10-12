--  @testpoint:openGauss关键字national(非保留)，同时作为表名和列名带引号，并进行dml操作,national列的值最终显示为1000

drop table if exists "national";
create table "national"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"national" varchar(100) default 'national'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "national"(c_id,"national") values(1,'hello');
insert into "national"(c_id,"national") values(2,'china');
update "national" set "national"=1000 where "national"='hello';
delete from "national" where "national"='china';
select "national" from "national" where "national"!='hello' order by "national";

drop table "national";

