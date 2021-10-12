--  @testpoint:openGauss保留关键字else同时作为表名和列名带引号，并进行dml操作,else列的值最终显示为1000
drop table if exists "else";
create table "else"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"else" varchar(100) default 'else'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "else"(c_id,"else") values(1,'hello');
insert into "else"(c_id,"else") values(2,'china');
update "else" set "else"=1000 where "else"='hello';
delete from "else" where "else"='china';
select "else" from "else" where "else"!='hello' order by "else";

drop table "else";