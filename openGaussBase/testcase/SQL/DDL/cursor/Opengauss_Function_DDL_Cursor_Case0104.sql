--  @testpoint:结合存储过程，显式游标，定义静态游标，提取同名游标；

--前置条件
drop table if exists cur_test_104;
create table cur_test_104(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_104 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA'),
                           (3,59,'Cathy','Shenzhen','AAAAADAAAAA'),(4,96,'David','Suzhou','AAAAAEAAAAA'),
                           (5,17,'Edrwd','Fenghuang','AAAAAFAAAAA'),(6,253,'Fendi','Changsha','AAAAAGAAAAA');

--创建存储过程，显式游标的使用,提取同名游标；
drop procedure if exists cursor_ftest_104;
create or replace procedure cursor_ftest_104()
as
declare
    fet_name varchar(10);
    cursor c104 is select c_name from cur_test_104 where c_id <= 5;
begin
    open c104;
    fetch c104 into fet_name;
    raise info 'fetch results:%',fet_name;
    close c104;
end;
/

call cursor_ftest_104();
drop table cur_test_104;
drop procedure cursor_ftest_104;
