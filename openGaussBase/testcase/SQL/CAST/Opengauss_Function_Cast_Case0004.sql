-- @testpoint: name类型转换
-- @modified at: 2020-12-3

--查询源数据类型和目标数据类型间的转化方式：
--'e'：表示只能进行显式转化（使用CAST或::语法）。
--'i'：表示只能进行隐式转化。
--'a'：表示类型间同时支持隐式和显式转化。
--转化方法：
--'f'：使用castfunc字段中指定的函数进行转化。
--'b'：类型间是二进制强制转化，不使用castfunc。
select typname,proname,castcontext,castmethod from pg_cast c
join pg_type t on t.oid=c.casttarget
left join pg_proc p on p.oid=c.castfunc
where c.oid in (select oid from pg_cast
where castsource= (select oid from pg_type where typname='name'));

--建表
drop table if exists test_cast_0004 cascade;
create table test_cast_0004(
c_bpchar bpchar,
c_varchar varchar,
c_nvarchar2 nvarchar2,
c_text text,
c_clob clob
);

--查询转换计划
--test point：隐式转换
explain performance insert into test_cast_0004 values(
'test_cast_0004'::name,'test_cast_0004'::name,
'test_cast_0004'::name,'test_cast_0004'::name,'test_cast_0004'::name);

--test point：显式转换
explain performance insert into test_cast_0004(c_bpchar) values(cast('test_cast_0004'::name as bpchar));
explain performance insert into test_cast_0004(c_varchar) values(cast('test_cast_0004'::name as varchar));
explain performance insert into test_cast_0004(c_nvarchar2) values(cast('test_cast_0004'::name as nvarchar2));

--清理数据
drop table if exists test_cast_0004 cascade;