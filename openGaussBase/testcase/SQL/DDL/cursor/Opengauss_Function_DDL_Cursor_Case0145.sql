--  @testpoint:结合存储过程，隐式游标，结合select语句，属性%NOTFOUND的使用；

--前置条件
drop table if exists cur_test_145;
create table cur_test_145(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_145 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA'),
                           (3,59,'Cathy','Shenzhen','AAAAADAAAAA'),(4,96,'David','Suzhou','AAAAAEAAAAA'),
                           (5,17,'Edrwd','Fenghuang','AAAAAFAAAAA'),(6,253,'Fendi','Changsha','AAAAAGAAAAA');

--创建存储过程，结合select语句，隐式游标属性%NOTFOUND为True，影响下一步SQL执行结果
drop procedure if exists cursor_ftest_145;
create or replace procedure cursor_ftest_145()
as
declare
    sql_str varchar(100);
begin
    sql_str := 'select * from cur_test_145 where c_id > 6;';
    execute immediate sql_str;
    if sql%notfound then
        delete from cur_test_145 where c_id <= 3;
    end if;
end;
/

call cursor_ftest_145();
select * from cur_test_145;
drop table cur_test_145;
drop procedure cursor_ftest_145;
