-- @testpoint: 函数bool_and，当入参输入两种数据类型不一致时，合理报错

select bool_and('a'<1);
select bool_and(array[1.1,2.1,3.1]::int[] =[1,2,3]);