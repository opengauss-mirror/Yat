-- @testpoint:运算符的计算
select (coalesce(1,null,23)+coalesce(null,2,11)-coalesce(null,null,null,2))*coalesce(6,null,'')/coalesce(null,2);