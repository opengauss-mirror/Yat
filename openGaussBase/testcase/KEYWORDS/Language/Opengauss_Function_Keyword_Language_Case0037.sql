--  @testpoint:opengauss关键字Language(非保留)，LANGUAGE plpgsql创建函数


drop FUNCTION if exists func_increment_plsql;
CREATE OR REPLACE FUNCTION func_increment_plsql(i integer) RETURNS integer AS $$
        BEGIN
                RETURN i + 1;
        END;
$$ LANGUAGE plpgsql;
/

select * from func_increment_plsql(5);

drop function func_increment_plsql;
