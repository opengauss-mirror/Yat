--  @testpoint: create gin index:maintenance_work_mem<work_men 分区表
SET ENABLE_SEQSCAN=off;
RESET ENABLE_INDEXSCAN;
RESET ENABLE_BITMAPSCAN;

show ENABLE_SEQSCAN;
show ENABLE_INDEXSCAN;
show ENABLE_BITMAPSCAN;


--set

set work_mem=133120;
show work_mem;
show maintenance_work_mem;



--partition table
DROP TABLE IF EXISTS test_gin_student_row;
CREATE TABLE test_gin_student_row
(
    num int,
    data1 text,
    data2 text
)
PARTITION BY RANGE(num)
(
    PARTITION num1 VALUES LESS THAN(10000),
    PARTITION num2 VALUES LESS THAN(20000),
    PARTITION num3 VALUES LESS THAN(300000)
);

--insert data
INSERT INTO test_gin_student_row SELECT num, md5(random()::text), md5(random()::text) FROM (SELECT * FROM generate_series(1,200000) AS num) AS x;

--didn't refer to special partition 
CREATE INDEX test_gin_student_index_row1 ON test_gin_student_row USING GIN(to_tsvector('english', data1)) LOCAL;
--refer to special partition
CREATE INDEX test_gin_student_index_row2 ON test_gin_student_row USING GIN(to_tsvector('english', data2)) LOCAL
(
    PARTITION data2_index_1,
    PARTITION data2_index_2,
    PARTITION data2_index_3 
) ;

--insert data
INSERT INTO test_gin_student_row VALUES(1, 'China, officially the People''s Republic of China (PRC), located in Asia, is the world''s most populous state.', 'China');
INSERT INTO test_gin_student_row VALUES(2, 'America is a rock band, formed in England in 1970 by multi-instrumentalists Dewey Bunnell, Dan Peek, and Gerry Beckley.', 'America');
INSERT INTO test_gin_student_row VALUES(3, 'England is a country that is part of the United Kingdom. It shares land borders with Scotland to the north and Wales to the west.', 'England');
INSERT INTO test_gin_student_row VALUES(4, 'Australia, officially the Commonwealth of Australia, is a country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.', 'Australia');
INSERT INTO test_gin_student_row VALUES(5, 'Russia, also officially known as the Russian Federation, is a sovereign state in northern Eurasia.', 'Russia');
INSERT INTO test_gin_student_row VALUES(6, 'Japan is an island country in East Asia.', 'Japan');
INSERT INTO test_gin_student_row VALUES(7, 'Germany, officially the Federal Republic of Germany, is a sovereign state and federal parliamentary republic in central-western Europe.');
INSERT INTO test_gin_student_row VALUES(8, 'France, is a sovereign state comprising territory in western Europe and several overseas regions and territories.', 'France');
INSERT INTO test_gin_student_row VALUES(9, 'Italy officially the Italian Republic, is a unitary parliamentary republic in Europe.', 'Italy');
INSERT INTO test_gin_student_row VALUES(10, 'India, officially the Republic of India, is a country in South Asia.', 'India');
INSERT INTO test_gin_student_row VALUES(11, 'Brazil, officially the Federative Republic of Brazil, is the largest country in both South America and Latin America.', 'Brazil');
INSERT INTO test_gin_student_row VALUES(12, 'Canada is a country in the northern half of North America.', 'Canada');
INSERT INTO test_gin_student_row VALUES(13, 'Mexico, officially the United Mexican States, is a federal republic in the southern part of North America.', 'Mexico');


--query
SELECT * FROM test_gin_student_row WHERE to_tsvector('english', data1) @@ to_tsquery('english', 'formed');
explain SELECT * FROM test_gin_student_row WHERE to_tsvector('english', data1) @@ to_tsquery('english', 'formed');
SELECT * FROM test_gin_student_row WHERE to_tsvector('english', data2) @@ to_tsquery('english', 'America');
explain SELECT * FROM test_gin_student_row WHERE to_tsvector('english', data2) @@ to_tsquery('english', 'America');

--tearDown drop table
DROP TABLE test_gin_student_row;
reset work_mem;

