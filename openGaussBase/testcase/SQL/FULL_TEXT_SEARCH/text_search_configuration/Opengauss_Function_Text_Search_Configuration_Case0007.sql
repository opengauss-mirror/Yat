--  @testpoint:ngram类型解析器，配置参数测试
--punctuation_ignore和grapsymbol_ignore分别取t和f
DROP TEXT SEARCH CONFIGURATION if exists ngram2;
CREATE TEXT SEARCH CONFIGURATION ngram2 (parser=ngram) WITH (gram_size = 2, punctuation_ignore= t,grapsymbol_ignore = f);
--punctuation_ignore和grapsymbol_ignore分别取0和1
DROP TEXT SEARCH CONFIGURATION if exists ngram3;
CREATE TEXT SEARCH CONFIGURATION ngram3 (parser=ngram) WITH (gram_size = 2, punctuation_ignore= 0,grapsymbol_ignore = 1);
--punctuation_ignore和grapsymbol_ignore分别取y和n
DROP TEXT SEARCH CONFIGURATION if exists ngram4;
CREATE TEXT SEARCH CONFIGURATION ngram4 (parser=ngram) WITH (gram_size = 2, punctuation_ignore= y,grapsymbol_ignore = n);
--删除文本搜索配置
DROP TEXT SEARCH CONFIGURATION ngram2;
DROP TEXT SEARCH CONFIGURATION ngram3;
DROP TEXT SEARCH CONFIGURATION ngram4;