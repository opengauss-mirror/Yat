--  @testpoint: 给表、视图的列创建注释，区分表名视图名，以及列名的大小写
comment on column false_3.A IS 'WMS';
comment on column false_3.a IS 'WMS';
comment on column false_3.f IS 'WMS';
comment on column false_3.F IS 'WMS';
comment on column FALSE_3.a IS 'WMS';
comment on column VIEW_3.a IS 'WMS';
comment on column view_3.F IS 'WMS';
comment on column view_3.f IS 'WMS';