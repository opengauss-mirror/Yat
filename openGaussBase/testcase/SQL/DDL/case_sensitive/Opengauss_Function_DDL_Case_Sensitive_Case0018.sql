--  @testpoint: --delete验证字段名大小写
delete from false_1 where B='xx';
delete from false_1 where B is null;
delete from false_1 where b is null;