-- @testpoint: next_day函数与last_day函数嵌套使用
select last_day(next_day('2020-06-13 14:58:54',1)) from sys_dummy;
select next_day(last_day('2020-06-13 14:58:54'),1) from sys_dummy;