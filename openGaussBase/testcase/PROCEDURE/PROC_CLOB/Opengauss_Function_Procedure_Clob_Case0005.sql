-- @testpoint: 存储过程clob数据类型的测试,文本作为存储过程的变量

--创建存储过程
create or replace procedure proc_clob_005(p1 in varchar2) is
v_lang clob:='字符串&*%￥14587';
begin
    for i in 1 .. 10000 loop
        v_lang := v_lang || p1;
    end loop;
    raise info 'size=:%',char_length(v_lang);
    exception
    when no_data_found then
        raise info 'no_data_found';
end;
/

--调用存储过程
call proc_clob_005('a');

--恢复环境
drop procedure if exists proc_clob_005;




