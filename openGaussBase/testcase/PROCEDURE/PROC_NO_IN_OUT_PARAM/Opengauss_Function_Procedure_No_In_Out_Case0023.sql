-- @testpoint: 测试无出入参存储过程（测试变量为bool型无入出参存储过程）

drop table if exists proc_no_in_out_param_001;
create table proc_no_in_out_param_001(
c_int int ,
c_integer integer not null ,
c_bigint bigint,
c_number number default 0.2332,
c_number1 number(12,2),
c_number2 number(12,6),
c_binary binary_double,
c_decimal decimal,
c_decimal1 decimal(8,2),
c_decimal2 decimal(8,4),
c_real real,c_char char(4000),
c_varchar varchar(4000),
c_varchar2 varchar2(4000),
c_varchar1 varchar(100),
c_char1 char(100),
c_numeric numeric,
c_date date,
c_timestamp timestamp,
c_timestamp1 timestamp(6),
c_bool bool
) ;

drop index if exists indx_t1 ;
create unique index  indx_t1 on proc_no_in_out_param_001 (c_int);
drop index  if exists indx_t2;
create index indx_t2 on proc_no_in_out_param_001 (c_int,c_timestamp);



create or replace procedure proc_no_in_out_param_022 as
v_bool bool;
begin
select c_bool into v_bool from proc_no_in_out_param_001 where c_int=12;
raise info ':%',v_bool;
exception
when no_data_found then raise info 'no_data_found';
end;
/

call proc_no_in_out_param_022();
drop procedure proc_no_in_out_param_022;
drop table if exists proc_no_in_out_param_001;