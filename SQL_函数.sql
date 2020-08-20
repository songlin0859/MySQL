show tables;
select * from student;
-- 在cmd里可以执行
select student.name, gid from student,grade where student.gid = grade.id group by gid;
select student.name, gid from student,grade where student.gid = grade.id order by gid;
select student.name, gid from student order by gid;
select * from student order by gid;
alter table student add age int;
update student set age = 15;
insert into student(name,age) values ('laoda',66);

select avg(age) from student;
commit;
mysql> select avg(age) from student group by gid;
+----------+
| avg(age) |
+----------+
|  32.0000 |
|  15.0000 |
|  15.0000 |
+----------+
3 rows in set (0.00 sec)

select @@global.sql_mode
--ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
--STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
set @@global.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
commit;

