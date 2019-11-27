# MySQL
1. 数据库的基本概念
2. MySQL数据库软件
  1. 安装 [下载地址](https://dev.mysql.com/downloads/installer/)
  2. 卸载 卸载和删除数据目录（去MySQL安装目录找到my.ini文件 在文件中找）
  3. 配置
    * mysql 服务 选中 计算机 右键 管理 - 服务
      cmd - services.msc
      net start mysql
      net stop mysql
    * mysql 登录
      1. mysql -uroot -p123456
      2. mysql - u root -p ******
      3. mysql -hip -uroot -p密码
      4. mysql --host=ip --user=user --password=pwd
    * mysql 退出
      1. exit
      2. quit
    * MySQL目录结构
      1. MySQL安装目录
        * 配置文件 my.ini
      2. MySQL数据目录
        * 数据库
        * 表
        * 数据
3. SQL
  1.什么是SQL
    Structured Query Language 结构化查询语句
    各种数据库操作方式不一样的地方 -- 方言
  2. SQL通用语法
    1. SQL语句可以单行或者多行书写，以分号结尾；
    2. 可以使用空格和缩进来增强语句的可读性；
    3. MySQL数据库的SQL语句不区分大小写，关键字建议使用大写；
    4. 注释
      * 单行注释： -- 注释内容 或者 # 注释内容（MySQL特有 -- 后面一定要用空格） 
      ```
      mysql> show databases ; -- 查看数据库
      +--------------------+
      | Database           |
      +--------------------+
      | db_sl              |
      | information_schema |
      | mysql              |
      | performance_schema |
      | sakila             |
      | sys                |
      | world              |
      +--------------------+
      7 rows in set (0.05 sec)
      ```
      ```
      mysql> show databases ; # 查看数据库
      +--------------------+
      | Database           |
      +--------------------+
      | db_sl              |
      | information_schema |
      | mysql              |
      | performance_schema |
      | sakila             |
      | sys                |
      | world              |
      +--------------------+
      7 rows in set (0.00 sec)
      ```
      --后面没有空格
      ```
      mysql> show databases ; --查看数据库
      +--------------------+
      | Database           |
      +--------------------+
      | db_sl              |
      | information_schema |
      | mysql              |
      | performance_schema |
      | sakila             |
      | sys                |
      | world              |
      +--------------------+
      7 rows in set (0.00 sec)

          -> ;
      ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--查看数据库' at line 1
      mysql>

      ```
      * 多行注释 /* 注释 */
      ```
      mysql> show databases ; /*查看数据库*/
      +--------------------+
      | Database           |
      +--------------------+
      | db_sl              |
      | information_schema |
      | mysql              |
      | performance_schema |
      | sakila             |
      | sys                |
      | world              |
      +--------------------+
      7 rows in set (0.00 sec)
      ```
  3. SQL分类
    1. DDL(Data Definition Language)数据定义语言
      用来定义数据对象：数据库、表、列 关键字 create、drop、alter
    2. DML（Data Manipulation Language）数据操作语言
      用来对数据中标的数据进行增删改 关键字 insert\delete\update
    3. DQL(Data Query Language)数据查询语言
    用来查询数据库表中的数据 关键字 select、where
    4. DCL（Data Control Language）数据控制语言（了解）
## DDL:操作数据库、表
  1. 操作数据库：CRUD
    1. C(Create)创建
      * 创建数据库db_csl 判断是否存在、并制定字符集为gbk
      create database if not exists db_csl character set gbk;
      ```
      mysql> create database if not exists db_csl character set gbk;
      Query OK, 1 row affected, 1 warning (0.00 sec)
      ```
    2. R(Retrieve)查询
      * 查询所以数据库的名称
        * show databases;
      * 查询某个数据库的字符集、创建语句
        * show create database db_name;
        ```
        mysql> show create database db_sl;
        +----------+----------------------------------------------------------------------------------------------+
        | Database | Create Database                                                                              |
        +----------+----------------------------------------------------------------------------------------------+
        | db_sl    | CREATE DATABASE `db_sl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ |
        +----------+----------------------------------------------------------------------------------------------+
        1 row in set (0.00 sec)
        ```
    3. U(Update)修改
      * 修改数据库字符集
        * alter database db_name character set charset_name;
      * 修改数据库名？？？？
    4. D（Delete）删除
      * 删库
        drop database if exists db_name;
    5. 使用数据库
      use db_name;
      ```
      mysql> use db_sl;
      Database changed
      ```
      查询正在使用的数据库名称
      select database();
## 数据库的基本概念
  1. 数据库的英文单词：DataBase 简称DB
  2. 什么是数据库
    * 用于存储和管理数据的仓库
  3. 数据库的特点：
    1. 持久化存储数据，其实数据库是一个文件系统
    2. 方便存储和管理
    3. 使用了统一的方式操作数据库 --SQL
  4. 常见的数据库软件 MySQL Oracle
