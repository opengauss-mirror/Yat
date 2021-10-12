-- @testpoint: 自定义函数同义词在触发器中调用
-- @modify at: 2020-11-25
--建表
drop table if exists SYN_TAB_009 cascade;
drop table if exists SYN_TAB_002 cascade;
create table SYN_TAB_009
(
	id int,
    name varchar2(10),
	sal number
);
create table SYN_TAB_002
(
	id int,
    name varchar2(10),
	sal number
);
--创建函数和同义词
drop function if exists SYN_FUN_001(c bigint);
create or replace function SYN_FUN_001(c bigint) return int
as
  b int := c;
begin
	for i in 1..c loop
		b := b + 1;
	end loop;
	return b;
end;
/
drop synonym if exists SYN_FUN_SYN_001;
create or replace synonym SYN_FUN_SYN_001 for SYN_FUN_001;
--创建触发器函数
CREATE OR REPLACE FUNCTION synonym_func() RETURNS TRIGGER AS
           $$
           DECLARE
           BEGIN
                   insert into SYN_TAB_002 values(SYN_FUN_SYN_001(SYN_FUN_SYN_001(3)),new.name,new.sal);
                   RETURN NEW;
           END
           $$ LANGUAGE PLPGSQL;
/
--创建触发器
CREATE TRIGGER synonym_trigger
           BEFORE INSERT ON SYN_TAB_009
           FOR EACH ROW
           EXECUTE PROCEDURE synonym_func();
/
--插入数据
insert into SYN_TAB_009 values(1,'aaa',2600);
insert into SYN_TAB_009 values(2,'bbb',2600);
insert into SYN_TAB_009 values(3,'ccc',2800);
--调用触发器
select name,sal from SYN_TAB_009;
select name,sal from SYN_TAB_002;
--清理环境
drop table if exists SYN_TAB_009 cascade;
drop table if exists SYN_TAB_002 cascade;
drop function if exists SYN_FUN_001(c bigint) cascade;
drop FUNCTION synonym_func();
drop synonym if exists SYN_FUN_SYN_001;
