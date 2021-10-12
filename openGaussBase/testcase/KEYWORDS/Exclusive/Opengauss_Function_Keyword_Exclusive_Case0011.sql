--  @testpoint:openGauss关键字exclusive(非保留)，同时作为表名和列名带引号，并进行dml操作,exclusive列的值最终显示为1000

drop table if exists "exclusive";
create table "exclusive"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"exclusive" varchar(100) default 'exclusive'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "exclusive"(c_id,"exclusive") values(1,'hello');
insert into "exclusive"(c_id,"exclusive") values(2,'china');
update "exclusive" set "exclusive"=1000 where "exclusive"='hello';
delete from "exclusive" where "exclusive"='china';
select "exclusive" from "exclusive" where "exclusive"!='hello' order by "exclusive";

drop table "exclusive";
