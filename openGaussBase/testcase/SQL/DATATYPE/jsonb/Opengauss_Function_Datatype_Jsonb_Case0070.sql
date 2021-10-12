-- @testpoint: 通用函数：jsonb_each_text（扩展最外层的 JSON 对象成为一组键/值对，当入参不合理时，合理报错）

--jsonb_each_text函数，入参合理
select jsonb_each_text ('{"f1":[1,2,3],"f2":{"f3":1},"f4":null}');
select jsonb_each_text ('{"a":1, "b":"test", "a":2,"b":true}');
select jsonb_each_text ('{"a":null, "bb": 1, "bb": "A",   "cde": [1,2,   "re"], "abc": 1}');

--jsonb_each_text函数，入参不合理
select jsonb_each_text ('[{"a":"foo"},{"b":"bar"},{"c":"baz"}]');
select jsonb_each_text('true');
select jsonb_each_text('138');
select jsonb_each_text('null');

--返回结果类型校验：record
select pg_typeof(jsonb_each_text ('{"a":1, "b":"test", "a":2,"b":true}'));