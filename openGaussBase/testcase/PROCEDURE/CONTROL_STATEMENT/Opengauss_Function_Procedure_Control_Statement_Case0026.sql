-- @testpoint: 匿名块中插入海量数据

declare
  v_lang clob := '待插入的海量字符串好';
begin
  for i in 1 .. 10000 loop
    v_lang := v_lang || '待插入的海量字符串好';
  end loop;
	raise notice '%',v_lang;
end;
/

