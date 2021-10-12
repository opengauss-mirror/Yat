--  @testpoint:openGauss关键字encoding(非保留)，同时作为表名和列名带引号，并进行dml操作,encoding列的值最终显示为1000

drop table if exists "encoding";
create table "encoding"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"encoding" varchar(100) default 'encoding'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "encoding"(c_id,"encoding") values(1,'hello');
insert into "encoding"(c_id,"encoding") values(2,'china');
update "encoding" set "encoding"=1000 where "encoding"='hello';
delete from "encoding" where "encoding"='china';
select "encoding" from "encoding" where "encoding"!='hello' order by "encoding";

drop table "encoding";
