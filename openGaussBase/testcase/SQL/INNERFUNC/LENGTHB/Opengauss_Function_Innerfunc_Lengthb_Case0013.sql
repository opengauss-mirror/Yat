-- @testpoint: 与数值函数结合使用
select  LENGTHB(abs(-2847892.11));

select char_length(ACOS(-0.9)) from sys_dummy;
select char_length(COS(120 * 3.141559/180)) from sys_dummy;