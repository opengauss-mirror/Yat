-- @testpoint:建立函数并制定参数数据类型；
CREATE FUNCTION Pseudo_Type_01(num1 anyelement,num2 anyarray,
num3 anynonarray,num4 anyenum,num5 anyrange,num6 integer,
num7 integer,num8 integer,num9 integer,num10 integer,
num11 integer,num12 integer,num13 integer,num14 integer) RETURN integer
AS
BEGIN
RETURN num1;
END;
/
drop FUNCTION Pseudo_Type_01;





