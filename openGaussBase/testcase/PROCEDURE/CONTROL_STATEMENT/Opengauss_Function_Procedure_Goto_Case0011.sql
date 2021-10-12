-- @testpoint: 存储过程中goto语句使用  不支持从外部块跳转到内部的begin-end块

create or replace procedure goto_test()
as
declare
begin
   goto pos1;
   begin
     <<pos1>>
      select user;
   end;
 end;
/
drop procedure goto_test;