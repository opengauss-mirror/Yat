-- @testpoint: 文本检索操作符<@，检查一个tsquery类型的词汇是否被包含另一个tsquery类型的词汇2

select 'cat & rat'::tsquery <@ 'cat'::tsquery as result;