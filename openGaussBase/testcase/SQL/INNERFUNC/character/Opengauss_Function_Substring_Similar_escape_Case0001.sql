-- @testpoint: 函数similar_escape(pat text, esc text)，将一个 SQL:2008风格的正则表达式转换为POSIX风格

--参数为有效值
select similar_escape('?.*','2');
select similar_escape('/<.*>/','');
select similar_escape('/<.*>/',1);