--  @testpoint:openGauss关键字scroll(非保留)，同时作为表名和列名带引号，并进行dml操作,scroll列的值最终显示为1000

drop table if exists "scroll" CASCADE;
create table "scroll"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"scroll" varchar(100) default 'scroll'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "scroll"(c_id,"scroll") values(1,'hello');
insert into "scroll"(c_id,"scroll") values(2,'china');
update "scroll" set "scroll"=1000 where "scroll"='hello';
delete from "scroll" where "scroll"='china';
select "scroll" from "scroll" where "scroll"!='hello' order by "scroll";

drop table "scroll";

