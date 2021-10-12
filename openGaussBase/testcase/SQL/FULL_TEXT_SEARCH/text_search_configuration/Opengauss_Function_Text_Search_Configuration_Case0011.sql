--  @testpoint:修改文本搜索配置字典语法测试
--创建文本搜索配置
DROP TEXT SEARCH CONFIGURATION if exists english2;
CREATE TEXT SEARCH CONFIGURATION english2 (parser=default);
--创建simple字典
DROP TEXT SEARCH DICTIONARY IF EXISTS pg_dict;
CREATE TEXT SEARCH DICTIONARY pg_dict (TEMPLATE = Simple);
--增加文本搜索配置字串类型映射
ALTER TEXT SEARCH CONFIGURATION english2 ADD MAPPING FOR numword WITH simple,english_stem;
--修改文本搜索配置字串类型映射语法
ALTER TEXT SEARCH CONFIGURATION english2 ALTER MAPPING REPLACE english_stem with french_stem;
--查询文本搜索配置相关信息
SELECT b.cfgname,c.dictname FROM pg_ts_config b, pg_ts_dict c WHERE b.cfgname='english2' and c.dictname in('simple','french_stem') ORDER BY 1,2;
--删除文本搜索配置
DROP TEXT SEARCH CONFIGURATION english2;
--删除字典
DROP TEXT SEARCH DICTIONARY pg_dict;