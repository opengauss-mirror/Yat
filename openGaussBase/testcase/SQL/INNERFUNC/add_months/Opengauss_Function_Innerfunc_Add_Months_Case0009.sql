-- @testpoint: 9.测试add_months的应用场景，作为函数入参
select to_number(to_char(ADD_MONTHS('2018-02-28','10'),'yyyymmdd')) from sys_dummy;
