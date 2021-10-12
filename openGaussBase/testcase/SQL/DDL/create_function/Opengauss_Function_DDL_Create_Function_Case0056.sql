-- @testpoint: 创建函数指定参数的数据类型，遍历整数类型，参数均为IN模式
DROP FUNCTION if EXISTS h_testfun3 (c_TINYINT TINYINT,c_SMALLINT SMALLINT,c_INTEGER INTEGER,c_BINARY_INTEGER BINARY_INTEGER,c_BIGINT BIGINT);
CREATE  FUNCTION h_testfun3 (c_TINYINT TINYINT,c_SMALLINT SMALLINT,c_INTEGER INTEGER,c_BINARY_INTEGER BINARY_INTEGER,c_BIGINT BIGINT) RETURNS int1 AS $$
        BEGIN
                RETURN c_TINYINT + c_SMALLINT+c_INTEGER+c_BINARY_INTEGER+c_BIGINT;
        END;
$$ LANGUAGE plpgsql;
/
--proallargtypes字段为空
select proargnames,proallargtypes from pg_proc where proname='h_testfun3';
call h_testfun3(100,100,10,10,35);
drop function  h_testfun3;