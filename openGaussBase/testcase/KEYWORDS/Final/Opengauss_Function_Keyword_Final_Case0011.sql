--  @testpoint:openGauss关键字final(非保留)，同时作为表名和列名带引号，并进行dml操作,final列的值最终显示为1000

drop table if exists "final";
create table "final"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"final" varchar(100) default 'final'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "final"(c_id,"final") values(1,'hello');
insert into "final"(c_id,"final") values(2,'china');
update "final" set "final"=1000 where "final"='hello';
delete from "final" where "final"='china';
select "final" from "final" where "final"!='hello' order by "final";

drop table "final";

