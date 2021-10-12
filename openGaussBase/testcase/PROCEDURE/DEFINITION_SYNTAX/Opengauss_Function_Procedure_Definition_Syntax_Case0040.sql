-- @testpoint: 匿名块定义 验证匿名块是否支持end if,elsif

DECLARE
x NUMBER(3) := 47;
BEGIN
  IF x < 10 THEN
   raise info  'X is less than 10';
  ELSIF x = 10 THEN
   raise info 'X is equal to 10';
  ELSIF x < 100 THEN
    raise info 'X is between 11 and 99';
  ELSE
    raise info 'X is greater than 99';
  END IF;
END;
/