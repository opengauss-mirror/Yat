--  @testpoint:结合存储过程，隐式游标，结合drop语句，属性%ROWCOUNT的使用；

--前置条件
drop table if exists cur_test_153;
create table cur_test_153(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_153 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA');

--创建存储过程，结合drop语句，隐式游标属性%ROWCOUNT；
drop procedure if exists cursor_ftest_153;
create or replace procedure cursor_ftest_153()
as
begin
    drop table cur_test_153;
    if sql%rowcount = 1  then
        create table cur_test_153(c_id int);
    end if;
end;
/

call cursor_ftest_153();

--属性未生效，没有返回读到的记录数，不影响下一步SQL执行结果，合理报错
select * from cur_test_153;
drop table cur_test_153;
drop procedure cursor_ftest_153;
