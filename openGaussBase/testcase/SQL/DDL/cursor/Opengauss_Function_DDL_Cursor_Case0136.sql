--  @testpoint:结合存储过程，隐式游标，结合insert into语句，属性%NOTFOUND的使用；

--前置条件
drop table if exists cur_test_136;
create table cur_test_136(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_136 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA'),
                           (3,59,'Cathy','Shenzhen','AAAAADAAAAA'),(4,96,'David','Suzhou','AAAAAEAAAAA'),
                           (5,17,'Edrwd','Fenghuang','AAAAAFAAAAA'),(6,253,'Fendi','Changsha','AAAAAGAAAAA');
create table test_136(id int);

--创建存储过程，结合insert into语句，隐式游标属性%NOTFOUND为True,影响下一步SQL执行结果；
drop procedure if exists cursor_ftest_136;
create or replace procedure cursor_ftest_136()
as
begin
    insert into test_136 select c_id from cur_test_136 where c_city='Xian';
    if sql%notfound then
        delete from cur_test_136 where c_id <= 3;
    end if;
end;
/

call cursor_ftest_136();
select * from cur_test_136;
drop table cur_test_136;
drop table test_136;
drop procedure cursor_ftest_136;


