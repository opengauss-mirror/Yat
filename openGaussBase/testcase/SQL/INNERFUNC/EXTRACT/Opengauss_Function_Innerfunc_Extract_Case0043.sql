-- @testpoint: extract(field from timestamp)从给定的时间戳里获取小时的值
--（field的取值范围：hour）
select extract(hour from timestamp '2001-02-16 20:38:40') from sys_dummy;
