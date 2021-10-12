-- @testpoint: 函数median(expression) [over (query partition clause)]，求取中位数，入参为无效值，合理报错

--入参为非数值型和非interval类型时合理报错
select median(name) from (values('小红'), ('小明'), ('小刚'), ('小黑')) as tt(name);
select median(id) from (values('b'), ('a'), ('c'), ('d')) as test(id);
