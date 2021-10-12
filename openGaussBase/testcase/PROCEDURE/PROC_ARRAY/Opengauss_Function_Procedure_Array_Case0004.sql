-- @describe:存储过程中声明带有默认值的record类型

--创建存储过程
CREATE OR REPLACE procedure pro_record_004() AS
DECLARE

  type rec_type2 is record (
        name varchar2 not null := 'SCOTT',
        epno int not null :=10);
		employer2 rec_type2;
BEGIN
      raise info 'employer2 name:%,epno2:%',employer2.name,employer2.epno;
 END;
 /
 
--调用存储过程
call pro_record_004();

--删除存储过程
drop procedure pro_record_004;
