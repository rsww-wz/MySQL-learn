/*
含义：一种限制，用于限制表中的数据，为了表中的数据的准确和可靠性

语法
	字段名 字段类型 约束
	
	一个字段可以有多个约束，直接在后面加即可 

分类：6大约束
	not null: 非空，用于保证该字段的值不能为空
	default: 默认，用于保证该字段有默认值
	primary key: 主键，用于保证该字段的值具有唯一性，并且非空
	unique: 唯一，用于保证该字段的值具有唯一性，但是可以为空
	check: 检查约束，MySQL中不支持
	foreign key： 外键，用于限制两个表的关系，用于保证该字段的值必须来自于主表的关联列的值
		在从表添加外键约束，用于引用主表中某列的值

添加约束的时机
	创建表时
	修改表时
	
约束的添加分类
	列级约束
		溜达约束语法都支持，单外键约束没有效果
	表级约束
		除了非空，默认，其他都支持
		

列级约束和表级约束区别
	位置不一样
	支持的约束类型不一样//
*/

/*
创建表时添加约束

添加列级约束
	语法

	直接在字段名和类型后面追加约束类型即可
	只支持：默认，非空，主键，唯一

添加表级约束
	语法
	在各个字段的最下面
	
	【constraint 约束名】 约束类型(字段名)
	
主键和唯一的区别
	都可以保证唯一性
	但是主键不允许为空，唯一可以为空
	
	一个表中主键最多只能有一个，唯一可以有多个
	都是允许组合的，但是不推荐组合主键，唯一可以组合

外键
	要求在从表设置外键关系
	从表的外键列的类型和主表的关联列的类型要求一致或者兼容，名称无要求
	主表的关联列必须是一个key（主键或者唯一）
	插入数据时，先插入主表，在插入从表
	删除数据时，先删除从表，在删除主表
*/

/*
修改表时添加约束

语法
	添加列级约束
		alter table 表名 modify 字段名 字段类型 新约束
	添加表级约束
		alter table 表名 add 【constraint 约束名】 约束类型（字段名） 【外键引用】

直接写即可
用关键字modify
但是添加主键和唯一约束时
	如果添加的是列级约束，用modify
	如果添加的是表级约束，用add

*/

/*
删除约束

删除非空约束和默认约束和修改约束的语法一样，只要不写约束，就是删除约束

删除主键
	alter table  表名 drop primary key
删除唯一
	alter table 表名 drop index 字段名
删除外键
	alter table 表名 drop foreign key 字段名
*/

CREATE DATABASE students;
USE students;

CREATE TABLE major(
	id INT PRIMARY KEY,
	majorName VARCHAR(20)
);

CREATE TABLE stuinfo(
	id INT PRIMARY KEY,
	stuName VARCHAR(20) NOT NULL,
	gender CHAR(1) CHECK(gender = '男' OR gender = '女'),
	seat INT UNIQUE,
	age INT DEFAULT 18
	# majorId INT FOREIGN KEY REFERENCES major(id)  # 语法错误
);

SELECT * FROM stuinfo;

# 查看索引
SHOW INDEX FROM stuinfo;
# 删除表
DROP TABLE IF EXISTS stuinfo;

# 添加表级约束
CREATE TABLE stuinfo(
	id INT,
	stuname VARCHAR(20),
	gender CHAR(1),
	seat INT,
	age INT,
	majorid INT,
	
	CONSTRAINT pk PRIMARY KEY(id),
	CONSTRAINT uq UNIQUE(seat),
	CONSTRAINT ck CHECK(gender = '男' OR gender = '女'),
	CONSTRAINT fk stuinfo_major FOREIGN KEY(majorid) REFERENCES major(id)
);


# 通用的写法
CREATE TABLE IF NOT EXISTS stuinfo(
	IN INT PRIMARY KEY,
	stuname VARCHAR(20) NOT NULL,
	sex CHAR(1),
	age INT DEFAULT 18,
	seat INT UNIQUE,
	majorid INT,
	CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorid) REFERENCES major(id)
);


















