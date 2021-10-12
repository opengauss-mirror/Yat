-- @testpoint: 对分区表名长度超过63进行截取
drop table if exists pppppppppppppplpppppppppppppplpppppppppppppplpppppppppppppplppp;
create table pppppppppppppplpppppppppppppplpppppppppppppplpppppppppppppplppppppppppppppl(
col_1 smallint,
col_2 char(30),
col_3 int,
col_4 date not null,
col_5 boolean,
col_6 nchar(30),
col_7 float
)
partition by range (col_4)
interval ('1 month')
(
	partition partition_table_001_p1 values less than ('2020-02-29')
);
select t1.relname from pg_partition t1, pg_class t2 where t1.parentid = t2.oid and t2.relname = 'pppppppppppppplpppppppppppppplpppppppppppppplpppppppppppppplppp' and t1.parttype = 'r';
drop table pppppppppppppplpppppppppppppplpppppppppppppplpppppppppppppplppp;