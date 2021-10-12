drop FUNCTION if EXISTS test_func3(A_func1 integer, A_func2 integer);

CREATE FUNCTION test_func3(A_func1 integer, A_func2 integer) RETURNS integer
    AS 'select $1 + $2;'
    LANGUAGE SQL
    IMMUTABLE
    RETURNS NULL ON NULL INPUT;
/
 select proargnames  from pg_proc where proname='test_func3';
drop FUNCTION test_func3;