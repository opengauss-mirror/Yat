-- @testpoint: 验证是否支持存储过程用户自定义异常查询抛出

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

create or replace  procedure  exception_017 ()  as
declare
empno_id_in emp.empno%type;
zero_devided exception;
begin
select empno into empno_id_in from emp where empno=7788;
if empno_id_in<>7369
then
raise zero_devided;
end if;
exception
when zero_devided
then
raise info 'wrong!';
end;
/
--调用存储过程
call exception_017();
--清理环境
drop procedure exception_017;
drop table if exists emp;