--  @testpoint:创建simple词典,template参数测试
--通过系统表PG_TS_TEMPLATE查看模板名取值范围(5种)
select tmplname from PG_TS_TEMPLATE;
--创建字典，模板名为simple，省略option选项
DROP TEXT SEARCH DICTIONARY IF EXISTS public.simple_dict;
CREATE TEXT SEARCH DICTIONARY public.simple_dict (
     TEMPLATE = pg_catalog.simple
);
--删除词典
DROP TEXT SEARCH DICTIONARY public.simple_dict;
