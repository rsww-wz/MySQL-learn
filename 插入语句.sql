# DML语言
/*
数据操作语言
	插入：insert
	修改：update
	删除：delete
*/

# 插入语句
/*
语法

方式1
	insert into 表名(列名(字段)，...)
	values(value1,value2,value3,...)

方式2
	insert into 表名
	set 列名 = 值，...
	
	
总结
	方式1支持插入多行
	方式2不支持插入多行
	
	方式1支持子查询
	方式2不支持子查询
	
	方式1用的比较多
	
插入的值的类型要与列的类型一致或者兼容

*/

SELECT * FROM beauty;

# 不可以为null的列必须插入值，可以为null的列如何插入值？
# 方式1：字段可以写，值可以写null
INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'唐艺昕','女','1990-4-23','189888888',NULL,2);


# 方式2: 字段直接不写，值就不用写了
INSERT INTO beauty(id,NAME,sex,borndate,phone,boyfriend_id)
VALUES(14,'金星','女','1990-4-23','1388888888',2);

# 没有插入的字段会取字段的默认值
INSERT INTO beauty(id,NAME,sex,phone)
VALUES(15,'娜扎','女','1388888888');



# 不可以调换字段和值的顺序
# 字段和值的顺序必须一一对应，而且列数和个数必须一致
# 但是可以调用字段之间的顺序
INSERT INTO beauty (NAME,sex,id,phone)
VALUES('蒋欣','女',16,'110')


# 可以省略列名，默认所有列，而且列的顺序和表中的顺序一致
INSERT INTO beauty
VALUES(18,'张飞','男',NULL,'119',NULL,NULL);


# 插入方式2
INSERT INTO beauty
SET id = 19,NAME = '刘涛',phone = '999';



# 方式一支持插入多行
INSERT INTO beauty
VALUES  (20,'关晓彤','女','1990-4-24','888',NULL,2),
	(21,'赵薇','女','1990-4-24','888',NULL,2),
	(22,'贾静雯','女','1990-4-24','888',NULL,2);


# 方式1支持子查询
# 执行方式是先执行查询，在执行插入语句
INSERT INTO beauty(id,NAME,phone)
SELECT 23,"宋茜",'11898903';

INSERT INTO beauty(id,NAME,phone)
SELECT id,boyname,'1234567'
FROM boys
WHERE id < 3;









