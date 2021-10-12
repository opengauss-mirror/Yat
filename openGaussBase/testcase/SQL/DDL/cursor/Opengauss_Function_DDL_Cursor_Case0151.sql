--  @testpoint:结合存储过程，隐式游标，结合create语句，属性%ROWCOUNT的使用；

--前置条件
drop table if exists cur_test_151;
create table cur_test_151(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_151 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA');

--创建存储过程，结合create语句，隐式游标属性%ROWCOUNT；
drop procedure if exists cursor_ftest_151;
create or replace procedure cursor_ftest_151()
as
begin
    create table test_151(id int);
    if sql%rowcount = 1  then
        delete from cur_test_151 where c_id <= 3;
    end if;
end;
/

call cursor_ftest_151();

--属性未生效，没有返回读到的记录数，不影响下一步SQL执行结果
select * from cur_test_151;
drop table cur_test_151;
drop table test_151;
drop procedure cursor_ftest_151;
