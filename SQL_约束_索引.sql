alter table student rename to stu;
show tables;
select * from stu;
explain select * from stu where age = 66;
--1	SIMPLE	stu	[CLOB]	ALL	null	null	null	null	5	20	Using where
--创建索引方式1
create index index_stu_age on stu(age);
explain select * from stu where age = 66;
--1	SIMPLE	stu	[CLOB]	ref	        index_stu_age	index_stu_age	5	    const	1	    100	null
--1	SIMPLE	stu	[CLOB]	ALL	        null	        null	        null	null	5	    20	Using where

--删除索引
drop index index_stu_age on stu;
--创建索引方式2
alter table stu add index index_age(age);
explain select * from stu where age = 66;
--1	SIMPLE	stu	[CLOB]	ref	index_age	index_age	5	const	1	100	null
drop index index_age on stu;
alter table stu drop index index_age;
--查询所有
show index from stu;

--创建索引方式3
CREATE TABLE mytable(
ID INT NOT NULL,
username VARCHAR(16) NOT NULL,
INDEX index_username (username)
);
show index from mytable;


--普通索引
--唯一索引