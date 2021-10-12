-- @testpoint: 删除他人为属主的同义词：成功
-- @modify at: 2020-11-26
--建表
drop table if exists SYN_TAB_072_001 cascade;
create table SYN_TAB_072_001 (a int,b clob);
insert into SYN_TAB_072_001 values(1,'a');
--建表的同义词
drop synonym if exists SYN_TAB_SYN_072_001;
create or replace synonym SYN_TAB_SYN_072_001 for SYN_TAB_072_001;
select * from SYN_TAB_SYN_072_001;
--创建用户
drop user if exists test_syn04 cascade;
create user test_syn04 password 'Test@123';
GRANT ALL PRIVILEGES TO test_syn04;
--修改属主
alter synonym syn_tab_syn_072_001 owner to test_syn04;
--查属主
select usename from pg_user where usesysid=(select synowner from pg_synonym where synname='syn_tab_syn_072_001');
--删除同义词
drop synonym SYN_TAB_SYN_072_001;
--清理环境
drop table if exists SYN_TAB_072_001 cascade;
drop synonym if exists SYN_TAB_SYN_072_001;
drop user if exists test_syn04 cascade;