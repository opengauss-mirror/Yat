--  @testpoint:修改函数的执行规则为STABLE
drop FUNCTION if EXISTS u_testfun44(c_int int);
CREATE FUNCTION u_testfun44 ( INOUT c_int int) RETURNS int  AS $$
        BEGIN
                RETURN (c_int);
        END;
$$ LANGUAGE plpgsql;
/

ALTER FUNCTION  u_testfun44(int) STABLE;
call u_testfun44(87);
drop FUNCTION u_testfun44;