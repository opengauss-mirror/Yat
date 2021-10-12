-- @testpoint: 删除触发器函数获取insert触发器的定义信息以pretty方式展示
-- @modified at: 2020-12-21

--创建源表和触发表
DROP TABLE IF EXISTS test_trigger_src_tbl;
DROP TABLE IF EXISTS test_trigger_des_tbl;
CREATE TABLE test_trigger_src_tbl(id1 INT, id2 INT, id3 INT);
CREATE TABLE test_trigger_des_tbl(id1 INT, id2 INT, id3 INT);

--创建触发器函数
CREATE OR REPLACE FUNCTION tri_insert_func() RETURNS TRIGGER AS
$$
DECLARE
BEGIN
	INSERT INTO test_trigger_des_tbl VALUES(NEW.id1, NEW.id2, NEW.id3);
	RETURN NEW;
END
$$ LANGUAGE PLPGSQL;
/

--创建触发器
CREATE TRIGGER insert_trigger BEFORE INSERT ON test_trigger_src_tbl FOR EACH ROW EXECUTE PROCEDURE tri_insert_func();
/

--删除触发器函数，获取insert触发器的定义信息，以pretty方式显示
DROP TRIGGER insert_trigger ON test_trigger_src_tbl;
SELECT pg_get_triggerdef(oid,true) FROM pg_trigger WHERE oid IN (SELECT oid FROM pg_trigger where tgname='insert_trigger');

--清理资源
DROP FUNCTION tri_insert_func() cascade;
DROP TABLE test_trigger_src_tbl;
DROP TABLE test_trigger_des_tbl;