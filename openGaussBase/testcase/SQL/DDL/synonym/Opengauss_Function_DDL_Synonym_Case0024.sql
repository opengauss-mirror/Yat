-- @testpoint: 自定义函数同义词与while loop结合使用
--建表
drop table if exists syn_tab_001 cascade;
create table syn_tab_001 (a int,b clob);
--建视图
drop view if exists syn_view_001 cascade ;
create or replace view syn_view_001 as select * from syn_tab_001;
--建视图的同义词
create or replace synonym syn_view_syn_001 for syn_view_001;
--建自定义函数
create or replace function syn_fun_001(c int)return number
as
	d int;
begin
	select count(*) into d from syn_view_syn_001 where a=c;
	return d;
end;
/
--建自定义函数同义词
drop synonym if exists syn_fun_syn_001;
create or replace synonym syn_fun_syn_001 for syn_fun_001;
--创建函数
drop function if exists SYN_FUN_005;
create or replace function SYN_FUN_005(a int) RETURN int
as
	i int :=0;
	j int :=0;
begin
	while i<=SYN_FUN_SYN_001(a) loop
		j:=j+1;
		i:=i+1;
	end loop;
	RETURN j;
end;
/
--调用函数
select SYN_FUN_005(-1);
select SYN_FUN_005(0);
select SYN_FUN_005(1);
select SYN_FUN_005(2);
--清理环境
drop function syn_fun_001;
drop function if exists SYN_FUN_005;
drop synonym if exists syn_fun_syn_001;
drop synonym if exists syn_view_syn_001;