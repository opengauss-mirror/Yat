--  @testpoint:openGauss关键字translation(非保留)，同时作为表名和列名带引号，并进行dml操作,translation列的值最终显示为1000

drop table if exists "translation" CASCADE;
create table "translation"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"translation" varchar(100) default 'translation'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "translation"(c_id,"translation") values(1,'hello');
insert into "translation"(c_id,"translation") values(2,'china');
update "translation" set "translation"=1000 where "translation"='hello';
delete from "translation" where "translation"='china';
select "translation" from "translation" where "translation"!='hello' order by "translation";

drop table "translation";

