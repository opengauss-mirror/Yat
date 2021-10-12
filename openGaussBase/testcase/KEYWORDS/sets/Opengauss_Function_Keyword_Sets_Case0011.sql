--  @testpoint:openGauss关键字sets(非保留)，同时作为表名和列名带引号，并进行dml操作,sets列的值最终显示为1000

drop table if exists "sets" CASCADE;
create table "sets"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"sets" varchar(100) default 'sets'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "sets"(c_id,"sets") values(1,'hello');
insert into "sets"(c_id,"sets") values(2,'china');
update "sets" set "sets"=1000 where "sets"='hello';
delete from "sets" where "sets"='china';
select "sets" from "sets" where "sets"!='hello' order by "sets";

drop table "sets";

