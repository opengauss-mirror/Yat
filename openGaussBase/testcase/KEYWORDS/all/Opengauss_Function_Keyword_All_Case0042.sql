--  @testpoint:定义all列带引号，使用时不带双引号或反引号，大小写匹配，应该报错
drop table if exists student_tb1;
create table student_tb1 ("all" char(20),stu_age int,sex char(10),score int,address char(10));
insert into student_tb1(all) values('lisi');