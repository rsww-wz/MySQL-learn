/*
表的管理

创建
	create table 【if exists】 表名(
		列名 类型 (长度)【可选】，约束【可选】
		...
	)


修改
	修改列名
		alter table 表名 change 【column】 原来的名字 新的名字（类型）
		
	修改列的类型活儿约束
		alter table 表名 modify column 列名 新类型
	添加列
		alter table 表名 add column 新列名 类型
	删除列
		alter table 表名 drop column 列名
	修改表名
		alter table 表名 rename to 新表名
		
		
	核心语法
		alter table 表名 功能 column 

删除
	drop table 表名
	
复制
	1.仅仅复制表的结构
		create table 新表名 like 被复制的表名
	2.复制表的结构+数据
		create table 新表名
		select * from 旧表名
		
	3.复制部分数据
		CREATE TABLE 新表名
		SELECT 字段
		from 旧表名
		WHERE 条件;
		
	4.复制部分字段
		CREATE TABLE 新表名
		SELECT 字段
		from 旧表名
		WHERE 不可能成立的条件(1=2);
*/

# 创建books库
CREATE DATABASE books;

# 创建表Book
CREATE TABLE IF EXISTS book(
	id INT,
	bName VARCHAR(20),
	price DOUBLE,
	authorId INT,
	publishDate DATETIME
);

 # 查看表的信息
DESC book;

# 创建表author
CREATE TABLE author(
	id INT,
	au_name VARCHAR(20),
	nation VARCHAR(20)
);

DESC author;


# 修改列名
ALTER TABLE book CHANGE COLUMN publishDate pubDate DATETIME;
DESC book;

# 修改类型
ALTER TABLE book MODIFY COLUMN pubDate TIMESTAMP;
DESC book;

# 添加新列
ALTER TABLE author ADD COLUMN annual DOUBLE;
DESC author;

# 删除列
ALTER TABLE author DROP COLUMN annual;
DESC author;

# 修改表名
ALTER TABLE author RENAME TO book_author;
DESC book_author;

# 表的删除
DROP TABLE book_author;
DROP TABLE IF EXISTS book_author;
SHOW TABLES;


INSERT INTO book 
SET id = 1,bName = '莫言';

INSERT INTO book 
SET id = 2,bName = '春上村树';

# 复制表的结构
CREATE TABLE copy LIKE book;
SELECT * FROM copy;

# 复制表的结构+数据(一条语句)
CREATE TABLE copy2
SELECT * FROM book;

# 只复制部分
CREATE TABLE copy3
SELECT id FROM book
WHERE id = 1;

SELECT * FROM copy3;
DROP TABLE copy3;


