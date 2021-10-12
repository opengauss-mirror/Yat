--  @testpoint:函数参数有三个，全部指定参数模式为INOUT
DROP FUNCTION if EXISTS j_testfun2 (i INOUT integer,j INOUT integer,k INOUT integer);
CREATE  FUNCTION j_testfun2 (i INOUT integer,j INOUT integer,k INOUT integer) RETURNS integer AS $$
        BEGIN
                RETURN i + j+k;
        END;
$$ LANGUAGE plpgsql;
/

--查询pg_proc表proargmodes字段为{b,b,b}，即三个参数的模式都是INOUT

select proargmodes from pg_proc where proname='j_testfun2';
drop function  j_testfun2;