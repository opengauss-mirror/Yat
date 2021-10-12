--  @testpoint:openGauss关键字unlogged(非保留)，同时作为表名和列名带引号，并进行dml操作,unlogged列的值最终显示为1000

drop table if exists "unlogged" CASCADE;
create table "unlogged"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"unlogged" varchar(100) default 'unlogged'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "unlogged"(c_id,"unlogged") values(1,'hello');
insert into "unlogged"(c_id,"unlogged") values(2,'china');
update "unlogged" set "unlogged"=1000 where "unlogged"='hello';
delete from "unlogged" where "unlogged"='china';
select "unlogged" from "unlogged" where "unlogged"!='hello' order by "unlogged";

drop table "unlogged";

