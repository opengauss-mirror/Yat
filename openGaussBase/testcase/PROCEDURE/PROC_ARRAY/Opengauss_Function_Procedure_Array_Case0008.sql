-- @testpoint: 存储过程中 在for循环中使用record变量

--创建表
drop table if exists emp_rec;
create table emp_rec(
empno      numeric(4,0) not null,
ename      character varying(10),
job        character varying(9),
mgr        numeric(4,0),
hiredate   timestamp(0) without time zone,
sal        numeric(7,2),
comm       numeric(7,2),
deptno     numeric(2,0));

--创建存储过程
CREATE OR REPLACE procedure pro_record_008() AS
DECLARE 
   type rec_type is record (name varchar2(100),epno int);
   employer rec_type;
BEGIN
     employer.name := 'WARD';
     employer.epno = 18;
     raise info 'employer name:%,epno:%',employer.name,employer.epno;  
     for employer in select ename,empno from emp_rec order by 1 limit 1
          loop
               raise info 'employer name:%,epno:%',employer.name,employer.epno;
          end loop;
END;
/

--调用存储过程
call pro_record_008();

--删除存储过程
drop procedure pro_record_008;
--删除表
drop table if exists emp_rec;
