--  @testpoint:定义OUT参数模式有两个，返回值设为record
drop FUNCTION if EXISTS x_testfun2;
CREATE FUNCTION x_testfun2 (c_int OUT int,c_int1 OUT int  ) returns setof record   AS $$
        BEGIN
                RETURN next;
        END;
$$ LANGUAGE plpgsql;
/
call x_testfun2(999,1);
drop FUNCTION x_testfun2;