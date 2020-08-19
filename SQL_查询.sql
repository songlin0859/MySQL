create table if not exists student(
    id int not null auto_increment comment 'id',
    name varchar(20) comment '姓名',
    gid int not null default 1 comment '班级id',
    primary key(id)
)engine = innoDB DEFAULT CHARSET=utf8;

insert into student(name, gid) values ('sl',1),('yt',2);
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