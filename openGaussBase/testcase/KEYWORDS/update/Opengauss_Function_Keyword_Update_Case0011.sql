--  @testpoint:openGauss关键字update(非保留)，同时作为表名和列名带引号，并进行dml操作,update列的值最终显示为1000

drop table if exists "update" CASCADE;
create table "update"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"update" varchar(100) default 'update'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "update"(c_id,"update") values(1,'hello');
insert into "update"(c_id,"update") values(2,'china');
update "update" set "update"=1000 where "update"='hello';
delete from "update" where "update"='china';
select "update" from "update" where "update"!='hello' order by "update";

drop table "update";

