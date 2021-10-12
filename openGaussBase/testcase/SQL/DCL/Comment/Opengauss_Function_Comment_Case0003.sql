--- Case Type： Comment
--- Case Name： 在模式上添加注释

--创建模式
drop schema if exists schema_comment;
create schema schema_comment;

--给模式添加注释信息
comment on schema schema_comment is '测试模式注释添加成功';

--在相关系统表中查看注释是否添加成功
select description from pg_description where objoid=(select oid from pg_namespace where nspname = 'schema_comment');

--清理环境
drop schema schema_comment;


