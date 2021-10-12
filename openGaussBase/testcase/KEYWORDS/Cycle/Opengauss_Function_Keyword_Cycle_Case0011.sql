--  @testpoint:openGauss关键字cycle(非保留)，同时作为表名和列名带引号，并进行dml操作,cycle列的值最终显示为1000

drop table if exists "cycle";
create table "cycle"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"cycle" varchar(100) default 'cycle'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "cycle"(c_id,"cycle") values(1,'hello');
insert into "cycle"(c_id,"cycle") values(2,'china');
update "cycle" set "cycle"=1000 where "cycle"='hello';
delete from "cycle" where "cycle"='china';
select "cycle" from "cycle" where "cycle"!='hello' order by "cycle";

drop table "cycle";
