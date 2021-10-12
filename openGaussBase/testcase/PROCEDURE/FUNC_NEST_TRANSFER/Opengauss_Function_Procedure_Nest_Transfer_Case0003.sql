-- @testpoint: 自定义函数嵌套调用———自定义函数嵌套匿名块

--创建自定义函数
create or replace function func_nest_transfer_003(p1 in varchar) return varchar2 is
  v_string varchar2(5000);
begin
  begin
    for i in 1..100 loop
     v_string:=v_string||p1;
    end loop;
  end;
  return(v_string);
end ;
/
--调用自定义函数
select func_nest_transfer_003('这是一个字符串');
--恢复环境
drop function if exists func_nest_transfer_003;

