-- @testpoint: 验证存储过程是否支持抛出用户自定义异常 low_income

create or replace procedure employee_income(salary number)
is
 low_income exception;
begin
  if salary<30000 then
    raise low_income;
    end if;
exception
  when low_income then
    raise info 'low_income:%',salary;
 end;
 /
call employee_income(10000);
drop procedure employee_income;