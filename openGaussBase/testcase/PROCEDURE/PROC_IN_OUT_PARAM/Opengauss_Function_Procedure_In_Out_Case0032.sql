-- @testpoint: 测试入参类型为int，出参类型为integer,输出数据集的存储过程

drop table if exists test_001;
create table test_001(
  t1 int,
  t2 integer not null,
  t3 bigint,
  t4 number default 0.2332,
  t5 number(12,2),
  t6 number(12,6),
  t7 binary_double,
  t8 decimal,
  t9 decimal(8,2),
  t10 decimal(8,4),
  t11 real,
  t12 char(4000),
  t13 char(100),
  t14 varchar(4000),
  t15 varchar(100),
  t16 varchar2(4000),
  t17 numeric,
  t19 date,
  t20 timestamp,
  t21 timestamp(6),
  t22 bool
) ;

create unique index indx_t1 on test_001(t1);
create index indx_t2 on test_001(t2,t17,t20);


--带入参和出参的存储过程测试（测试入参类型为int，出参类型为integer,输出数据集的存储过程）
create or replace procedure proc_in_out_param_0032(
p1 in int,
p2 out integer
)
as
begin
	for i in(select t2 from test_001 where t1>p1) 
	loop 
		raise info 'result:%',i.t2;
		p2:=i.t2;
	end loop;
	exception 
		when no_data_found 
		then 
			raise info 'no_data_found';
end;
/
--调用存储过程
declare
	v_p2 integer;
begin
	proc_in_out_param_0032(12,v_p2);
end;
/
--清理环境
drop procedure proc_in_out_param_0032;
drop table test_001;