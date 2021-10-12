-- @testpoint: 通用函数：json_extract_path_text_op（在指定的路径获取JSON对象为text,等效于#>>操作符，当入参不合理时，合理报错）

--json_extract_path_text_op函数，入参合理
select json_extract_path_text_op('{"f2":{"f3":1},"f4":{"f5":99,"f6":"stringy"}}','{"f4","f6"}');
select json_extract_path_text_op ('{"f1":[1,2,3],"f2":{"f3":1},"f4":null}','{"f2","f3"}');
select json_extract_path_text_op ('{"a":1, "b":"test", "a":2,"b":true}','{"a","4"}');
select json_extract_path_text_op ('{"a": {"b":{"a":{"b":{"a":{"b":88}}}}}}','{"a","b"}');
select json_extract_path_text_op ('[{"a":"foo"},{"b":"bar"},{"c":"baz"}]','{"a","4"}');
select json_extract_path_text_op ('[{"a":"foo"},{"b":"bar"},{"c":"baz"}]','{"2"}');
select json_extract_path_text_op('true','{"2"}');
select json_extract_path_text_op('138158','{"138"}');
select json_extract_path_text_op('null','{"n"}');

--json_extract_path_text_op函数，入参不合理
select json_extract_path_text_op ('[{"a":"foo"},{"b":"bar"},{"c":"baz"}]','2,1');
select json_extract_path_text_op ('"a","foo","b","bar","c":"baz"','{"b","c"}');
select json_extract_path_text_op('true,false','true');
select json_extract_path_text_op('138,158,369','138');
select json_extract_path_text_op('null','n');

--返回结果类型校验：text
select pg_typeof(json_extract_path_text_op ('{"a": {"b":{"a":{"b":{"a":{"b":88}}}}}}','{"a","b"}'));