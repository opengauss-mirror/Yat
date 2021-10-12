--  @testpoint:openGauss关键字datafile(非保留)同时作为表名和列名带引号,并使用该列结合limit排序,datafile列的值按字母大小排序且只显示前2条数据

drop table if exists "datafile";
create table "datafile"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"datafile" varchar(100) default 'datafile'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);
delete from "datafile";
insert into "datafile"(c_id,"datafile") values(1,'hello');
insert into "datafile"(c_id,"datafile") values(2,'china');
insert into "datafile"(c_id,"datafile") values(3,'gauss');
select "datafile" from "datafile" where "datafile"!='hello' order by "datafile" limit 2 ;

drop table "datafile";

