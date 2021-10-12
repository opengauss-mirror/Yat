-- @testpoint: && 重叠（两个函数有共同点）

--当两函数有重叠时，结果返回true
select int4range(1,5) && '[1,4]'::int4range as result;
select int8range(15,25) && int8range(15,25) as result;
select tsrange('[2021-01-01,2021-03-01)') && ('[2021-01-01,2021-03-01)') as result;
select tsrange('[2013-12-11 pst,2021-03-01 pst)') && ('[2013-12-11 pst,2021-05-01 pst)') as result;

--函数不相等时，结果返回false
select numrange(1.1,2.2,'[]') && numrange(5.1,6.7,'()') as result;
select int4range(10,10) && '(10,11)'::int4range as result;