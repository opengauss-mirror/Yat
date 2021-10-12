-- @testpoint: 给二进制类型，插入数据
--建表
drop table  if exists test_tb_hextoraw;
create  table test_tb_hextoraw
(
id integer,
hex varchar(50),
hex1 raw(100),
hex2 text
);
drop index if exists test_tb_hextoraw_index;
create index test_tb_hextoraw_index on test_tb_hextoraw(id);
--插入数据
insert into test_tb_hextoraw values(1,'10.12.14.225','1512','sd1');
insert into test_tb_hextoraw values(2,'ddf','',null);
insert into test_tb_hextoraw values(3,'w-2','565','20000');
insert into test_tb_hextoraw values(4,hextoraw('d5'),hextoraw('6f6'),'0');
--清理环境
drop table  if exists test_tb_hextoraw;