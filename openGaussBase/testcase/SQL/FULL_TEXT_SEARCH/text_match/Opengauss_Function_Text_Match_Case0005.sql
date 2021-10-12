--  @testpoint:使用等价命令to_tsvector(text) @@ tsquery和to_tsvector(text) @@ plainto_tsquery(text)（返回false）
----使用等价命令to_tsvector(text) @@ tsquery查询，::tsquery不会标准化处理
SELECT to_tsvector('a fat cat sat on a mat and ate a fat rat')@@ 'cats & rat'::tsquery AS RESULT;
SELECT to_tsvector('a fat cat sat on a mat and ate a fat rat')@@ 'cat & ra'::tsquery AS RESULT;
--::tsquery 和to_tsvector顺序颠倒
SELECT  'cats & rat'::tsquery @@ to_tsvector('a fat cat sat on a mat and ate a fat rat')AS RESULT;
--不符合检索条件
SELECT to_tsvector('a fat sat on a mat and ate a fat rat')@@ plainto_tsquery('cats & rat') AS RESULT;