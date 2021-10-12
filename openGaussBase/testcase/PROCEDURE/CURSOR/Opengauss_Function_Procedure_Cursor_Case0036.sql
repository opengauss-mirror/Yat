-- @testpoint: 创建带游标变量的游标,测试游标属性%isopen和%rowcount

drop table if exists emp_test;
create table emp_test(empno int,ename varchar(10),job varchar(10) ,sal integer);
insert into emp_test values(1,'zhangsan','doctor1',10000);
insert into emp_test values(2,'zhangsan2','doctor2',10000);
insert into emp_test values(123,'zhangsan3','doctor3',10000);
insert into emp_test values(1,'zhansi','doctor1',12000);
insert into emp_test values(2,'lisiabc','doctor2',13000);
insert into emp_test values(123,'zhangwu123','doctor3',14000);

create or replace procedure syscur_036()
is
DECLARE
  cv sys_refcursor;
  v_emp_test  emp_test%rowtype;
begin
    if not cv%isopen then
        open CV for select * from emp_test order by empno,ename;
        fetch cv into v_emp_test;
    while cv%FOUND loop
        raise info ':%',v_emp_test.job;
        fetch cv into v_emp_test;
    end loop;
        raise info 'return row is% ',cv%rowcount;
        raise info '-------------------------------------';
    close cv;
    end if;
end;
/
call syscur_036();
drop procedure syscur_036;
drop table emp_test;