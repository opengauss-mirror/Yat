--  @testpoint:openGauss关键字Inout(非保留)，同时作为表名和列名带引号，并进行dml操作,Inout列的值最终显示为1000

drop table if exists "Inout";
create table "Inout"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Inout" varchar(100) default 'Inout'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "Inout"(c_id,"Inout") values(1,'hello');
insert into "Inout"(c_id,"Inout") values(2,'china');
update "Inout" set "Inout"=1000 where "Inout"='hello';
delete from "Inout" where "Inout"='china';
select "Inout" from "Inout" where "Inout"!='hello' order by "Inout";

drop table "Inout";
