-- @testpoint: 验证存储过程是否支持抛出用户自定义异常 failure_password

create or replace procedure password_test(passwords number)
is 
 failure_password exception;
begin
  if passwords<>'123' then
    raise failure_password;
    end if;
exception
  when failure_password then
    raise info 'failure_password:%',passwords;
 end;
 /
call password_test(234);
drop procedure password_test;