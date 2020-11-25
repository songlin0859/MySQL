CREATE DATABASE IF NOT EXISTS test;
USE test;
//学生
CREATE TABLE IF NOT EXISTS student(
	`id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
	`name` VARCHAR(20),
	`age` INT,
	`grade` INT,
	PRIMARY KEY(id)
) ENGINE = INNODB CHARSET = utf8;
//年级
CREATE TABLE IF NOT EXISTS grade(
	id INT NOT NULL AUTO_INCREMENT,
	gname VARCHAR(20),
	PRIMARY KEY(id)
)ENGINE = INNODB CHARSET = utf8;
//分数
CREATE TABLE IF NOT EXISTS result(
	sid INT,
	score INT
)ENGINE = INNODB CHARSET = utf8;

INSERT INTO student(`name`, grade)VALUES("zhangshan",1),("lisi",1),("wangwu",2),("zhaoliu",2),("xiaoming",3);
SELECT * FROM student;
UPDATE student SET age = 18;

INSERT INTO grade(gname)VALUES('grade1'),('grade2'),('grade3'),('grade4');
SELECT * FROM grade;

INSERT INTO result(sid,score)VALUES(1,100),(2,80),(3,90),(4,50);
SELECT * FROM result;
//笛卡尔积
SELECT * FROM student,grade,result;

//查询每个年级有哪些学生
SELECT gname, `name` FROM grade g
INNER JOIN student s
ON s.grade = g.id;

SELECT gname, `name` FROM grade g
LEFT JOIN student s
ON s.grade = g.id;

SELECT gname, `name` FROM grade g
RIGHT JOIN student s
ON s.grade = g.id;

SELECT gname, `name` FROM grade g,student s WHERE s.grade = g.id;

//查询每个年级每个同学的成绩

SELECT gname,`name`,score FROM grade g
INNER JOIN student s
ON s.grade = g.id
INNER JOIN result r
ON  s.id = r.sid;


SELECT gname,`name`,score FROM grade g
LEFT JOIN student s
ON s.grade = g.id
LEFT JOIN result r
ON  s.id = r.sid;

//子查询
SELECT gname,`name`,score FROM 



