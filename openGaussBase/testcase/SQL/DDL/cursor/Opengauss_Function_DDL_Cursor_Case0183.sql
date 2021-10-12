--  @testpoint:while loop循环使用游标,不结合存储过程；

--前置条件
drop table if exists cur_test_183;
create table cur_test_183(c_id int,c_num int,c_name varchar(10),c_city varchar(10),c_add varchar(20));
insert into cur_test_183 values(1,18,'Allen','Beijing','AAAAABAAAAA'),(2,368,'Bob','Shanghai','AAAAACAAAAA'),
                           (3,59,'Cathy','Shenzhen','AAAAADAAAAA'),(4,96,'David','Suzhou','AAAAAEAAAAA'),
                           (5,17,'Edrwd','Fenghuang','AAAAAFAAAAA'),(6,253,'Fendi','Changsha','AAAAAGAAAAA');


declare
    cursor_183 int := 1;
begin
    while cursor_183 < (select c_id from cur_test_183 where c_num = 59) loop
        update cur_test_183 set c_name='HAHA' where c_id = cursor_183;
        cursor_183 := cursor_183+1;
    end loop;
end;
/

select * from cur_test_183;
drop table cur_test_183;
