-- @testpoint: regexp_replace函数替换匹配POSIX正则表达式的子字符
select regexp_replace('Thomas', '.[mN]a.', 'M');