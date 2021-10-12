-- @testpoint: 自定义函数同义词在游标中调用
-- @modify at: 2020-11-25
--建表
drop table if exists SYN_TAB_001 cascade;
create table SYN_TAB_001
(
	id int,
    name varchar2(10),
	sal number
);
--插入数据
insert into SYN_TAB_001 values(1,'aaa',2600);
insert into SYN_TAB_001 values(1,'bbb',2600);
insert into SYN_TAB_001 values(2,'ccc',2800);
insert into SYN_TAB_001 values(3,'ddd',3000);
insert into SYN_TAB_001 values(3,'fff',3000);
insert into SYN_TAB_001 values(4,'eee',3200);
--创建函数
create or replace function SYN_FUN_001(a number) return number
as
begin
	return a+1000;
end;
/
--创建函数的同义词
drop synonym if exists SYN_FUN_SYN_001;
create or replace  synonym  SYN_FUN_SYN_001 for SYN_FUN_001;
--创建存储过程
create or replace procedure SYN_PROC_001
as
	c_cur sys_refcursor;
	c_id int;
  c_name varchar2(10);
	c_syn number;
begin
	open c_cur for select id,name,SYN_FUN_SYN_001(sal) syn from SYN_TAB_001;
	loop
		fetch c_cur into c_id,c_name,c_syn;
		exit when c_cur%notfound;
	    raise info 'c_id:% - c_name:% - c_syn:%',c_id,c_name,c_syn;
	end loop;
	close c_cur;
end;
/
--调用存储过程
select SYN_PROC_001();
--清理环境
drop table if exists SYN_TAB_001 cascade;
drop function SYN_FUN_001;
drop procedure SYN_PROC_001;
