--  @testpoint:以dest_encoding指定的目标编码方式转化字符串bytea
SELECT convert('text_in_utf8', 'UTF8', 'GBK');