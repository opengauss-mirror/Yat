-- @testpoint: lower函数，minus的使用
drop table if exists TEST_LOWER_008;
create table TEST_LOWER_008(COL1 varchar2(20));
select lower(COL1) from TEST_LOWER_008 minus select lower(COL1) from TEST_LOWER_008 order by 1;
drop table if exists TEST_LOWER_008;