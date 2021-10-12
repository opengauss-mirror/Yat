-- @testpoint: 验证是否支持匿名块抛出自定义异常

drop table if exists emp;
create table emp
       (empno number(4) not null,
        ename varchar2(10),
        job varchar2(9),
        mgr number(4),
        hiredate date,
        sal number(7, 2),
        comm number(7, 2),
        deptno number(2));
insert into emp values
        (7369, 'smith',  'clerk',     7902,
        to_date('17-dec-1980', 'dd-mon-yyyy'),  800, null, 20);
insert into emp values
        (7499, 'allen',  'salesman',  7698,
        to_date('20-feb-1981', 'dd-mon-yyyy'), 1600,  300, 30);
insert into emp values
        (7521, 'ward',   'salesman',  7698,
        to_date('22-feb-1981', 'dd-mon-yyyy'), 1250,  500, 30);
insert into emp values
        (7566, 'jones',  'manager',   7839,
        to_date('2-apr-1981', 'dd-mon-yyyy'),  2975, null, 20);
insert into emp values
        (7654, 'martin', 'salesman',  7698,
        to_date('28-sep-1981', 'dd-mon-yyyy'), 1250, 1400, 30);
insert into emp values
        (7698, 'blake',  'manager',   7839,
        to_date('1-may-1981', 'dd-mon-yyyy'),  2850, null, 30);
insert into emp values
        (7782, 'clark',  'manager',   7839,
        to_date('9-jun-1981', 'dd-mon-yyyy'),  2450, null, 10);
insert into emp values
        (7788, 'scott',  'analyst',   7566,
        to_date('09-dec-1982', 'dd-mon-yyyy'), 3000, null, 20);
insert into emp values
        (7839, 'king',   'president', null,
        to_date('17-nov-1981', 'dd-mon-yyyy'), 5000, null, 10);
insert into emp values
        (7844, 'turner', 'salesman',  7698,
        to_date('8-sep-1981', 'dd-mon-yyyy'),  1500,    0, 30);
insert into emp values
        (7876, 'adams',  'clerk',     7788,
        to_date('12-jan-1983', 'dd-mon-yyyy'), 1100, null, 20);
insert into emp values
        (7900, 'james',  'clerk',     7698,
        to_date('3-dec-1981', 'dd-mon-yyyy'),   950, null, 30);
insert into emp values
        (7902, 'ford',   'analyst',   7566,
        to_date('3-dec-1981', 'dd-mon-yyyy'),  3000, null, 20);
insert into emp values
        (7934, 'miller', 'clerk',     7782,
        to_date('23-jan-1982', 'dd-mon-yyyy'), 1300, null, 10);

declare
   v_empno emp.empno%type;
   v_sal   emp.sal%type;
   no_result  exception;
begin
  select sal into v_sal from emp where v_empno=7890;
   raise info ':%',v_sal;
   if sql%notfound then
      raise no_result;
   end if;
exception
   when no_result then
      raise info '906---no data found';
   when others then
      raise info '---:%',sqlerrm;
end;
/
--清理环境
drop table if exists emp;