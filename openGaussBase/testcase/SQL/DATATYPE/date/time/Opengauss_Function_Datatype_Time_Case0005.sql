-- @testpoint: 结合case when条件

SELECT CASE WHEN time '11:22:33' > time '11:22:33' THEN 'A' ELSE 'B' END;