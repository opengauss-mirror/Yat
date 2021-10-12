--  @testpoint:创建函数添加参数COST，估计函数的执行成本是100
drop FUNCTION if EXISTS u_testfun5(c_int int);
CREATE FUNCTION u_testfun5(c_int int) RETURNS int  AS $$
        BEGIN
                RETURN (c_int);
        END;
$$ LANGUAGE plpgsql
STRICT
COST 100;
/

call u_testfun5(999);
drop FUNCTION u_testfun5;