-- @testpoint: 文本比较操作符 < ，比较数字类型的词汇

select to_tsvector('100') <  to_tsvector('200') as result;