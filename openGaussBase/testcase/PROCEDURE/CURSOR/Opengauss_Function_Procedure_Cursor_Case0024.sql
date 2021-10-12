-- @testpoint: invalid_cursor异常捕获  调用函数异常 合理报错

drop table if exists emp;
create table emp(empno int,ename varchar(10),job varchar(10) ,sal integer);
insert into emp values(1,'zhangsan','doctor1',10000),(2,'zhangsan2','doctor2',10000),(123,'zhangsan3','doctor3',10000);
insert into emp values(1,'zhansi','doctor1',10000),(2,'lisiabc','doctor2',10000),(123,'zhangwu123','doctor3',10000);
insert into emp values(10,'abc','worker',9000);
insert into emp values(716,'ZHANGSAN','leader',20000);

create or replace procedure syscur_024(sys_cur OUT SYS_REFCURSor)
is
invalid_cursor exception;
C1 sys_refcursor;
begin
open C1 for
    select empno,ename from emp  where empno=1 order by empno;
sys_cur := null;
end;
/

declare
 cv sys_refcursor;
  v_empno     emp.empno%TYPE;
  v_ename     emp.ename%TYPE;
begin
syscur_024(cv);
  loop
    fetch cv into v_empno, v_ename;
    exit when cv%NOTFOUND;
        raise info ':% ',v_ename;
  end loop;
  raise info  '-------------------------------------' ;
  close cv;
exception
   when invalid_cursor
   then  raise info 'invalid_cursor';
end;
/
call syscur_024();
drop table emp;
drop procedure syscur_024;
