-- @testpoint: 操作符#，bit和bit varying 位数不一致，合理报错
select B'11110' # B'0000';