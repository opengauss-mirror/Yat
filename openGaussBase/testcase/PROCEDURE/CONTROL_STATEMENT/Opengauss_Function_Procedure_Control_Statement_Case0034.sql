-- @testpoint: 自定义函数中测试execute immediate 动态查询

drop table if exists t_001;
create table  t_001(id int,n varchar2(200),x date);

create or replace function f1(v_id  int) return int is
  v_r int:=0;
begin
  v_r:=v_id+100;
  return v_r;
end;
/

create or replace function f2(v_d date) return int is
  v_r int := 0;
begin
  if v_d < to_date('2019-01-31 16:07:03','yyyy-mm-dd hh24:mi:ss') then
    v_r := -1;
  else
    v_r := 1;
  end if;
  return v_r;
end;
/

insert into t_001  values (1,'x1',to_date('2019-01-31 16:07:03','yyyy-mm-dd hh24:mi:ss'));
insert into t_001  values (2,'x2',to_date('2019-02-01 16:07:03','yyyy-mm-dd hh24:mi:ss'));
insert into t_001  values (3,'x3',to_date('2019-01-31 16:00:03','yyyy-mm-dd hh24:mi:ss'));

select f1(id), f1(id) * id, f1(id) + f2(x), t.id
  from t_001 t
 where not exists (select f1(t.id) from sys_dummy where true and 0=f2(x));
update t_001 set id=f2(x);
delete from t_001 t
 where (1, f1(id)) in
       (select f2(x), f1(id) from t_001 t1 where f2(x) = f1(id) - 101
       and t.id=2);

declare
  v_f    int;
  v_fid  int;
  v_f1f2 int;
  v_id   int;
begin
  execute immediate 'select f1(id), f1(id) * id, f1(id) + f2(x), t.id
  from t_001 t
 where f1(id)=101 and not exists (select f1(t.id) from sys_dummy where true and 0=f2(x)) limit 1'
    into v_f, v_fid, v_f1f2, v_id;
  raise notice '%',v_f;
end;
/

insert into t_001 select f1(id),n,x from t_001;

drop table if exists t_001;
drop function f1;
drop function f2;

