-- @testpoint: default_text_search_config参数测试（无效性）合理报错
--使用set命令设置default_text_search_config为不存在的文本搜索配置，合理报错
set default_text_search_config to sample;
set default_text_search_config to simples;
--参数中含有数字
set default_text_search_config to simple1;
--参数中含有特殊字符
set default_text_search_config to 'simple*&^^%';