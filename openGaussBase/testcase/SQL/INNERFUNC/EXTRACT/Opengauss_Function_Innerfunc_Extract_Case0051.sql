-- @testpoint: extract(field from timestamp)从给定的时间戳里获取一周的第几天的值
--（field的取值范围：isodow 一周的第几天（1-7）(星期一为1，星期天为7））
select extract(isodow from timestamp '2020-06-16 20:38:40') from sys_dummy;