--  @testpoint:创建词典语法测试,name参数长度测试
--创建词典（name长度为63）
DROP TEXT SEARCH DICTIONARY IF EXISTS auuscscbhjhcbvjxkchnvckdvjndckslxvnvnnvnpvbldkbvjmuoplmkhgfrewq;
CREATE TEXT SEARCH DICTIONARY auuscscbhjhcbvjxkchnvckdvjndckslxvnvnnvnpvbldkbvjmuoplmkhgfrewq (TEMPLATE = Simple);
--创建词典（name长度为64,截取前63位）
DROP TEXT SEARCH DICTIONARY IF EXISTS auuscscbhjhcbvjxkchnvckdvjndckslxvnvnnvnpvbldkbvjmuoplmkhgfrewqr;
CREATE TEXT SEARCH DICTIONARY auuscscbhjhcbvjxkchnvckdvjndckslxvnvnnvnpvbldkbvjmuoplmkhgfrewqr (TEMPLATE = Simple);
--删除词典
DROP TEXT SEARCH DICTIONARY auuscscbhjhcbvjxkchnvckdvjndckslxvnvnnvnpvbldkbvjmuoplmkhgfrewq;
