-- @testpoint: power函数,入参为特殊字符 'Infinity' & '-Infinity'
select  power('Infinity','Infinity') as result from sys_dummy;
select  power('Infinity',1) as result from sys_dummy;
select  power('Infinity',0) as result from sys_dummy;
select  power('Infinity',8) as result from sys_dummy;
select  power('-Infinity','Infinity') as result from sys_dummy;
select  power('-Infinity',0) as result from sys_dummy;
select  power('-Infinity',8) as result from sys_dummy;