--  @testpoint:创建函数，指定函数的语言的名称是SQL,函数体内使用select语句
--创建函数，没有参数且返回基本类型
drop FUNCTION if EXISTS one();
CREATE FUNCTION one() RETURNS integer AS $$
        SELECT 1 AS result;
    $$ LANGUAGE SQL;
 /
 call  one();
 drop FUNCTION one();
