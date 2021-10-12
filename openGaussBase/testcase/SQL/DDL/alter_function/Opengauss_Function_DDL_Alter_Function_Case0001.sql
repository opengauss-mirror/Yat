--  @testpoint:修改已存在的函数名称
--创建函数名为u_testfun5的函数
drop FUNCTION if EXISTS u_testfun5(c_int int);
CREATE FUNCTION u_testfun5 (c_int int) RETURNS int  AS $$
        BEGIN
                RETURN (c_int);
        END;
$$ LANGUAGE plpgsql
STRICT;
/
select proargnames,proname from pg_proc where proname='u_testfun5';

--修改函数名u_testfun5为 u_testfun6
ALTER FUNCTION u_testfun5(c_int int)rename to u_testfun6;
select proargnames,proname from pg_proc where proname='u_testfun6';
drop FUNCTION u_testfun6;