--  @testpoint:关键字xmlconcat，用作函数名(合理报错)


create function xmlconcat(num1 bigint,num2 bigint)
return bigint
as
begin
    return num1+num2;
end;
/

select * from xmlconcat(55555,666666);

