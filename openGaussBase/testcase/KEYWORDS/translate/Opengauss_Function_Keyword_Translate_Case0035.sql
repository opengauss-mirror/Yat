--  @testpoint:openGauss关键字translate(非保留),
-- 把在string中包含的任何匹配from中字符的字符转化为对应的在to中的字符，from匹配到string,to不为空

--from比to 长，且都不为空，函数执行成功

SELECT translate('12345', '1', 'ax');
--from比to 短，且都不为空，函数执行成功

SELECT translate('12345', '14', 'axys');
--from与to 长度相等，且不为空，函数执行成功

SELECT translate('12345', '12345', 'saxyd');

