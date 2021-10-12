-- @testpoint: 关键字xmlparse，用作字段名

drop table if exists xmlparse_test cascade;
create table xmlparse_test(id int,xmlparse varchar(20));

create or replace procedure xmlparse_insert
as
begin
 for i in 1..10 loop
    insert into xmlparse_test values(i,'xcd'||i);
    end loop;
 end;
/
call xmlparse_insert();

select * from xmlparse_test;
drop table if exists xmlparse_test cascade;
drop procedure xmlparse_insert;