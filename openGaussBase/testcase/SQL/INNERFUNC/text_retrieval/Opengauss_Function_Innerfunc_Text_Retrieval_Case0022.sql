-- @testpoint: 文本检索操作符&&，将三个tsquery类型的词汇进行“与”操作

select 'rat'::tsquery && 'cat'::tsquery && ',' ::tsquery  as result;