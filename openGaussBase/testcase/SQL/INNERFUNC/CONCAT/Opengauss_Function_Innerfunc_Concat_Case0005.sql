-- @testpoint: 时间类型的值与中文拼接
select concat('2013-12-11 16:00:00+08'::timestamp with time zone,'哈喽');