--  @testpoint:openGauss保留关键字Authorization同时作为表名和列名带引号，并进行dml操作,Authorization列的值最终显示为1000
drop table if exists "Authorization";
create table "Authorization"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Authorization" varchar(100) default 'Authorization'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--插入数据
insert into "Authorization"(c_id,"Authorization") values(1,'hello');
insert into "Authorization"(c_id,"Authorization") values(2,'china');

--更新表数据
update "Authorization" set "Authorization"=1000 where "Authorization"='hello';

--清理表数据
delete from "Authorization" where "Authorization"='china';

--查看表数据
select "Authorization" from "Authorization" where "Authorization"!='hello' order by "Authorization";

--清理环境
drop table "Authorization";