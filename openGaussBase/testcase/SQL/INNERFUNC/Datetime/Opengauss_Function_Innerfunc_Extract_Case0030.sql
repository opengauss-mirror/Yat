--  @testpoint: ◾将epoch值转换为时间戳的方法不加时区

SELECT TIMESTAMP WITHOUT TIME ZONE 'epoch' + 1 * INTERVAL '1 second' AS RESULT;
SELECT TIMESTAMP WITHOUT TIME ZONE 'epoch' + 1.5 * INTERVAL '1 second' AS RESULT;
SELECT TIMESTAMP WITHOUT TIME ZONE 'epoch' + 0 * INTERVAL '1 second' AS RESULT;