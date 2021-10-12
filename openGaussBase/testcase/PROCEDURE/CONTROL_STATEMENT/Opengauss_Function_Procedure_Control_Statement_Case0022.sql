-- @testpoint: 存储过程if else使用

create or replace procedure p004(v_num in out int) is
  v_num_1 int;
  v_num_2 int;
begin
  v_num_1 := v_num - 1;
  v_num_2 := v_num - 2;
  if v_num < 3 then
    v_num := 1;
  else
    p004(v_num_1);
    p004(v_num_2);
    v_num := v_num_1 + v_num_2;
  end if;
end;
/

declare
  v_num int;
begin
    v_num := 16;
    p004(v_num);
    raise notice '%',v_num;
end;
/

drop procedure p004;
