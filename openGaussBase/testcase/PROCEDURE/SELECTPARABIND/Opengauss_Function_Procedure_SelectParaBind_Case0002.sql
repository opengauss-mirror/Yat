-- @testpoint: insert语句绑定数值类型

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
create or replace procedure pro_002()
as
    sqlstat varchar(500);
	v1 integer;
	v2 bigint;
	v3 real;
	v4 decimal;
	v5 number;
begin
    v1 := '21474';
	v3 := 1e;
	v4 := 1.0e20;
	v5 := 1.0e20;
    sqlstat := 'insert into all_datatype_tbl(c_integer) select :p1';
    execute immediate sqlstat using v1;
    sqlstat := 'insert into all_datatype_tbl(c_bigint) select :p1';
    execute immediate sqlstat using v2;
    sqlstat := 'insert into all_datatype_tbl(c_real) select :p1';
    execute immediate sqlstat using v3;
    sqlstat := 'insert into all_datatype_tbl(c_decimal) select :p1';
    execute immediate sqlstat using v4;
    sqlstat := 'insert into all_datatype_tbl(c_number) select :p1';
    execute immediate sqlstat using v5;
end;
/
--调用存储过程
call pro_002();

--查看表数据
select c_boolean from all_datatype_tbl;

--清理环境
drop procedure pro_002;
drop table all_datatype_tbl;