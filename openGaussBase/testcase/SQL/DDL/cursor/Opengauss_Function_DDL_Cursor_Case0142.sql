--  @testpoint:结合存储过程，隐式游标，结合select语句，属性%FOUND的使用；

--前置条件
drop table if exists cur_test_142;
create table cur_test_142(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_142 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA'),
                           (3,59,'Cathy','Shenzhen','AAAAADAAAAA'),(4,96,'David','Suzhou','AAAAAEAAAAA'),
                           (5,17,'Edrwd','Fenghuang','AAAAAFAAAAA'),(6,253,'Fendi','Changsha','AAAAAGAAAAA');

--创建存储过程，结合select语句，隐式游标属性%FOUND为True，影响下一步SQL执行结果
drop procedure if exists cursor_ftest_142;
create or replace procedure cursor_ftest_142()
as
declare
    sql_str varchar(100);
begin
    sql_str := 'select * from cur_test_142 where c_id = 6;';
    execute immediate sql_str;
    if sql%found then
        update cur_test_142 set c_name = 'CHINA' where c_id <= 3;
    end if;
end;
/

call cursor_ftest_142();
select * from cur_test_142;
drop table cur_test_142;
drop procedure cursor_ftest_142;
