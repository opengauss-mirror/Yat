--  @testpoint:关键字all作为普通表的列名，大小写混合，不带引号，应该报错
drop table if exists test_all_001 CASCADE ;
create table test_all_001 (All int);