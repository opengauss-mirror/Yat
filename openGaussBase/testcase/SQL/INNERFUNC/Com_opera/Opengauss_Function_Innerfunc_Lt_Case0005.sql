-- @testpoint: opengauss比较操作符<=，时间日期类型
-- 时间日期类型，比较的是时间早晚
SELECT '9999-12-30'::DATE <= '9999-12-31'::DATE;
SELECT '9999-12-31 23:59:59.999999'::SMALLDATETIME <= '0001-01-01 00:00:00.000000'::SMALLDATETIME;
SELECT '9999-12-31 23:59:59.999998'::SMALLDATETIME <= '9999-12-31 23:59:59.999999'::SMALLDATETIME;
SELECT '0001-01-01 00:00:00.00000'::TIME <= '0001-01-01 00:00:00.00000'::TIME;
SELECT '2013-12-12 pst'::TIMESTAMP <= '2013-12-11 pst'::TIMESTAMP;