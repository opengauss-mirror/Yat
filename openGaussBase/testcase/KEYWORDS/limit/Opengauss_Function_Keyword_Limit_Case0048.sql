--  @testpoint:在临时表关键字limit作为列名的字段上 创建索引
drop table if exists test_temporary_limit_008;
create temporary table test_temporary_limit_008("limit" int);
create index index_limit_002 on test_temporary_limit_008("limit");