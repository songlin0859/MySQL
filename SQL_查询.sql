create table if not exists student(
    id int not null auto_increment comment 'id',
    name varchar(20) comment '姓名',
    gid int not null default 1 comment '班级id',
    primary key(id)
)engine = innoDB DEFAULT CHARSET=utf8;

create table grade(
    id int auto_increment comment 'id',
    name varchar(10) comment '班级名称',
    primary key(id)
)engine=innoDB DEFAULT CHARSET=utf8;

insert into grade(id,name) values (1,'一年级'),(2,'二年级');
select * from grade;
commit;

insert into student(name, gid) values ('sl',1),('yt',2);
insert into student(name, gid) values ('csl',1),('lyt',2);
select * from student;
select * from student limit 1;
select * from student limit 0,1;
select name as `姓名`, gid `班级` from student limit 0,1;
commit;
mysql> select name as `姓名`, gid as `班级` from student limit 0,1;
+------+------+
| 姓名 | 班级 |
+------+------+
| sl   |    1 |
+------+------+
1 row in set (0.01 sec)

show databases;
use mysql_test;
show tables;

--所有内容（笛卡尔积）
select * from student,grade;
insert into student(name,gid) values ('xxx',3);
insert into grade(name) values ('9年级');
delete from grade where id = 3;
-- 内连接 左外连接 右外连接
select * from student s,grade g where s.gid=g.id;
select * from student s inner join grade g on s.gid=g.id;
select * from student s join grade g on s.gid=g.id;
select * from student left join grade on student.gid = grade.id;
select s.id,s.name,g.name from student s left join grade g on s.gid = g.id;
select * from student right join grade on student.gid = grade.id;

--explain
explain select * from student s join grade g on s.gid=g.id;
