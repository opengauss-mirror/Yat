-- @testpoint: insert语句绑定日期类型

--创建测试表
drop table if exists all_datatype_tbl;
create table all_datatype_tbl(
	c_id integer,
	c_boolean boolean,
	c_integer integer, c_bigint bigint,
	c_real real,
	c_decimal decimal(38), c_number number(38),
	c_char char(50) default null, c_varchar varchar(50), c_clob clob,
    c_blob blob,
	 c_timestamp timestamp, c_interval interval day to second);

--创建存储过程
create or replace procedure pro_004()
as
    sqlstat varchar(500);
	v2 timestamp;
begin
	v2 := to_date('2020-11-24 13:14:15', 'yyyy-mm-dd hh24:mi:ss');
    sqlstat := 'insert into all_datatype_tbl(c_timestamp) select :p1';
    execute immediate sqlstat using v2;
end;
/
call pro_004();

--查看表数据
select c_boolean from all_datatype_tbl;

--清理环境
drop procedure pro_004;
drop table all_datatype_tbl;