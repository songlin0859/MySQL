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

-- ===============================
-- #数据类型 https://www.cnblogs.com/-xlp/p/8617760.html
--整数类型：BIT、BOOL、TINY INT、SMALL INT、MEDIUM INT、 INT、 BIG INT
--浮点数类型：FLOAT、DOUBLE、DECIMAL
--字符串类型：CHAR、VARCHAR、TINY TEXT、TEXT、MEDIUM TEXT、LONGTEXT、TINY BLOB、BLOB、MEDIUM BLOB、LONG BLOB
--日期类型：Date、Time、DateTime、TimeStamp、Year
--其他数据类型：BINARY、VARBINARY、ENUM、SET、Geometry、Point、MultiPoint、LineString、MultiLineString、Polygon、GeometryCollection等

1、整型
MySQL数据类型 	含义（有符号）
tinyint(m) 	    1个字节  范围(-128~127)
smallint(m) 	2个字节  范围(-32768~32767)
mediumint(m) 	3个字节  范围(-8388608~8388607)
int(m) 	        4个字节  范围(-2147483648~2147483647)
bigint(m) 	    8个字节  范围(+-9.22*10的18次方)
取值范围如果加了unsigned，则最大值翻倍，如tinyint unsigned的取值范围为(0~256)。
int(m)里的m是表示SELECT查询结果集中的显示宽度，并不影响实际的取值范围，没有影响到显示的宽度，不知道这个m有什么用。
填充零：
勾选上“零填充”之后就会有很大的不同，若选择 int(4)，存储 18 （十进制），则数据库中显示的是 0018（十进制），如果填写 12345（十进制），此时超过了选择的指定宽度 4，但未超过 int 可存储范围（无符号时：0 ---- 2e(32)-1），会按原样存储。
int(n)：
n 的定义与存储空间没有任何关系，底层存储还是4个字节。
create table if not exists num(
    id int(5) ZEROFILL,
    id1 int ZEROFILL
)engine=innoDB DEFAULT CHARSET=utf8;
insert into num(id, id1) values (1,11);
select * from num;
commit;
-- 在cmd中查看数据
mysql> select * from num;
+-------+------------+
| id    | id1        |
+-------+------------+
| 00001 | 0000000011 |
+-------+------------+

2、浮点型(float和double)
MySQL数据类型 	含义
float(m,d) 	    单精度浮点型    8位精度(4字节)     m总个数，d小数位
double(m,d) 	双精度浮点型    16位精度(8字节)    m总个数，d小数位
、设一个字段定义为float(6,3)，如果插入一个数123.45678,实际数据库里存的是123.457，但总个数还以实际为准，即6位。
整数部分最大是3位，如果插入数12.123456，存储的是12.1234，如果插入12.12，存储的是12.1200.
alter table num add column f float(6,3);
desc num;
insert into num(f) values (12.0),(1234567.2),(12.123456),(123.1);
--Error executing SQL statement. Data truncation: Out of range value for column 'f' at row 2 - Connection: Connection: 366ms
insert into num(f) values (12.0),(12.123456),(123.1);
select all f from num;
commit;
mysql> select f from num;
+---------+
| f       |
+---------+
|    NULL |
|  12.000 |
|  12.123 |
| 123.100 |
+---------+
4 rows in set (0.00 sec)
3、定点数
浮点型在数据库中存放的是近似值，而定点类型在数据库中存放的是精确值。
decimal(m,d) 参数m<65 是总个数，d<30且 d<m 是小数位。

4、字符串(char,varchar,_text)
MySQL数据类型 	含义
char(n) 	固定长度，最多255个字符
varchar(n) 	固定长度，最多65535个字符
tinytext 	可变长度，最多255个字符
text 	可变长度，最多65535个字符
mediumtext 	可变长度，最多2的24次方-1个字符
longtext 	可变长度，最多2的32次方-1个字符

5.二进制数据(_Blob)
1._BLOB和_text存储方式不同，_TEXT以文本方式存储，英文存储区分大小写，而_Blob是以二进制方式存储，不分大小写。
2._BLOB存储的数据只能整体读出。
3._TEXT可以指定字符集，_BLO不用指定字符集。

6.日期时间类型
MySQL数据类型 	含义
date 	日期 '2008-12-2'
time 	时间 '12:25:36'
datetime 	日期时间 '2008-12-2 22:06:44'
timestamp 	自动存储记录修改时间

数据类型的属性


MySQL关键字 	含义
NULL 	数据列可包含NULL值
NOT NULL 	数据列不允许包含NULL值
DEFAULT 	默认值
PRIMARY KEY 	主键
AUTO_INCREMENT 	自动递增，适用于整数类型
UNSIGNED 	无符号
CHARACTER SET name 	指定一个字符集
