--  @testpoint:删除存在的函数，省略IF EXISTS 子句并且省略函数参数
drop FUNCTION if EXISTS u_testfun88(c_int int);
CREATE FUNCTION u_testfun88 ( INOUT c_int int) RETURNS int  AS $$
        BEGIN
                RETURN (c_int);
        END;
$$ LANGUAGE plpgsql;
/

select proname from pg_proc where proname='u_testfun88';
--只添加函数名删除函数
drop FUNCTION  u_testfun88;