-- @testpoint:数据类型转换 DATE 转换为 VARCHAR2

drop table if exists FVT_PROC_SCALAR_TYPE_table_002;
CREATE TABLE FVT_PROC_SCALAR_TYPE_table_002(
  T1 INT,
  T2 INTEGER NOT NULL,
  T3 INT,
  T4 NUMBER DEFAULT 0.2332,
  T5 NUMBER(12,2),
  T6 NUMBER(12,6),
  T7 BINARY_DOUBLE,
  T8 DECIMAL,
  T9 DECIMAL(8,2),
  T10 DECIMAL(8,4),
  T11 REAL,
  T12 CHAR(4000),
  T13 CHAR(100),
  T14 VARCHAR(4000),
  T15 VARCHAR(100),
  T16 VARCHAR2(4000),
  T17 NUMERIC,
  T19 DATE,
  T20 TIMESTAMP,
  T21 TIMESTAMP(6),
  T22 BOOL,
  T23 DATE
) ;
INSERT INTO FVT_PROC_SCALAR_TYPE_table_002 VALUES(12,58812,554,1234567.89,12345.6789,12.3456789,1234.56,2345.67,12345.6789,12.3456789,12.33,'dbcd','abcde','1999-01-01','ab','adc',
123.45,'2005-08-08','2000-01-01 15:12:21.11','2000-08-01 15:12:21.32',true,'20200728');

CREATE OR REPLACE PROCEDURE FVT_PROC_SCALAR_TYPE_002()  AS
declare
V1 FVT_PROC_SCALAR_TYPE_table_002.T23%type;
BEGIN
alter table FVT_PROC_SCALAR_TYPE_table_002 modify (T23 VARCHAR2(20));
INSERT INTO FVT_PROC_SCALAR_TYPE_table_002 VALUES(12,58812,554,1234567.89,12345.6789,12.3456789,1234.56,2345.67,12345.6789,12.3456789,12.33,'dbcd','abcde','1999-01-01','ab','adc',123.45,'2005-08-08','2000-01-01 15:12:21.11','2000-08-01 15:12:21.32',true,'hellow postgres');
EXCEPTION
WHEN NO_DATA_FOUND THEN raise info 'NO_DATA_FOUND';
END;
/

CALL FVT_PROC_SCALAR_TYPE_002();
select T23 from FVT_PROC_SCALAR_TYPE_table_002;

drop table if exists FVT_PROC_SCALAR_TYPE_table_002;
drop procedure if exists FVT_PROC_SCALAR_TYPE_002;