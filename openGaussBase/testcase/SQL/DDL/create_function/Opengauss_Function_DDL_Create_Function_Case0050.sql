--  @testpoint:只有一个参数，指定参数模式是OUTER，合理报错
    DROP FUNCTION if EXISTS g_testfun3 (i OUTER integer);
    CREATE  FUNCTION g_testfun3 (i OUTER integer) RETURNS integer AS $$
        BEGIN
                RETURN i + 1;
        END;
$$ LANGUAGE plpgsql;
/