--  @testpoint:openGauss保留关键字Asc同时作为表名和列名带引号，并进行dml操作,Asc列的值最终显示为1000
drop table if exists "Asc";
create table "Asc"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Asc" varchar(100) default 'Asc'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--插入数据
insert into "Asc"(c_id,"Asc") values(1,'hello');
insert into "Asc"(c_id,"Asc") values(2,'china');

--更新表数据
update "Asc" set "Asc"=1000 where "Asc"='hello';

--清理表数据
delete from "Asc" where "Asc"='china';

--查看表数据
select "Asc" from "Asc" where "Asc"!='hello' order by "Asc";

--清理环境
drop table "Asc";