-- @testpoint: to_date函数，将文本类型的值转换为指定格式的时间戳，结合where条件查询

select add_months(to_date('2016-02-29','yyyy-mm-dd'),1) from sys_dummy where
to_number(substr(to_date(extract (year from date '2018-09-18'+1),'yyyy'),1,4))< 2019;