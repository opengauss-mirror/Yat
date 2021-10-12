--- Case Type： Comment
--- Case Name： 在视图上添加注释

--创建表
drop table if exists index_comment;
create table table_comment(id int,name varchar(10));

--创建视图
create or replace view view_comment as select * from table_comment;

--给视图添加注释信息
comment on view view_comment is '测试视图注释添加成功';

--在相关系统表中查看注释是否添加成功
select description from pg_description where objoid=(select oid from pg_class where relname='view_comment');

--清理环境
drop table table_comment cascade;


