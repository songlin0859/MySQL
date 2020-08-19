#查看数据库中的表
show tables;
# 创建表
create table if not exists t1(
    id int primary key not null auto_increment comment 'id',
    name varchar(20) comment '名字',
    age tinyint comment '年龄'
) engine=innoDB DEFAULT CHARSET=utf8;
#查看建表语句
show create table t1;
#查看表结构
desc t1;
#数据类型
#添加一个字段
alter table t1 add gender tinyint default 0;
alter table t1 add column gender1 tinyint default 0;
alter table t1 add column gender2 tinyint default 0 first;
alter table t1 add column gender3 tinyint default 0 after age;
#删除一个字段
alter table t1 drop gender;
#修改一个字段类型
alter table t1 modify column gender2 varchar(5);
#重命名一个字段
alter table t1 change column gender3 gender333 int;
#修改表名
alter table t1 rename to tt1;
alter table tt1 rename to t1;
#删除表
drop table if exists t1;
#添加数据
insert into t1(name,age) values ('sl',30),('yt',26);
#更新数据
update t1 set age = 29 where name = 'sl';
#查询所有数据
select * from t1;
#删除数据
delete from t1 where name = 'sl';
#删除所有数据
delete from t1;
truncate t1; #id从0开始

#======================================================
# alter table
# 1. 修改表名
alter table t1 rename to tt1;
show tables;
alter table tt1 rename to t1;
show tables;
# 2. 增加一列
alter table t1 add gender tinyint default 0;
alter table t1 add column gender1 tinyint default 0;
alter table t1 add column gender2 tinyint default 0 first;
alter table t1 add column gender3 tinyint default 0 after age;
desc t1;
# 3. 删除一列
alter table t1 drop gender333;
desc t1;
# 4. 修改列类型
alter table t1 modify gender2 varchar(10);
desc t1;
# 5. 修改列名
alter table t1 change gender2 sex tinyint;
desc t1;
# 6. 设置和取消默认值
alter table t1 alter sex set default 6;
select * from t1;
insert into t1(name) values ('ll');
alter table t1 alter sex drop default;
select * from t1;
insert into t1(name,sex) values ('ll1',1);
--ALTER TABLE <表名> [修改选项]
--修改选项的语法格式如下：
--{ ADD COLUMN <列名> <类型>
--| CHANGE COLUMN <旧列名> <新列名> <新列类型>
--| ALTER COLUMN <列名> { SET DEFAULT <默认值> | DROP DEFAULT }
--| MODIFY COLUMN <列名> <类型>
--| DROP COLUMN <列名>
--| RENAME TO <新表名> }

-- column 可选 <必选参数> {n选1}
