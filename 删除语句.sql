# 删除语句
/*
delete

方式1：删除表的某行或者某些数据，不会删除整个表
1. 单表的删除（重点）
	delete from 表名
	where 筛选条件
	
2.多表的删除（补充）
192
	delete 表
	from 表1 别名，表2 别名
	where 连接条件
	and 筛选条件
	
199
	delete 表1 别名，表2 别名
	from 表1 别名
	inner/left/right join 表2 别名
	on 连接条件
	where 筛选条件

方式2：删除整个表
	truncate table 表名
	
	
总结
	delete 可以加where语句，truncate 不能加where语句
	假如用delete删除后，再插入数据，自增长列的值从断点开始
	truncate删除后，再插入数据自增长列的值从1开始
	
	
	实际上就是delete语句可以删除指定信息
	truncate只能删除整个表
	
	delete删除可以回滚
	truncate删除不能回滚
*/

# 单表的删除

SELECT * FROM beauty;

# 删除手机号以9结尾的女神信息
DELETE FROM beauty 
WHERE phone LIKE '%9';

# 多表的删除
# 删除张无忌的女朋友的信息
DELETE b
FROM beauty AS b
INNER JOIN boys AS bo
ON b.`boyfriend_id` = bo.`id`
WHERE bo.`boyName` = '张无忌';


# 删除黄晓明的信息以及他女朋友的信息
DELETE b,bo
FROM beauty AS b
INNER JOIN boys AS bo
ON b.`boyfriend_id` = bo.`id`
WHERE bo.`boyName` = '黄晓明';

SELECT * FROM boys;



# 将魅力值>100的男神信息删除
# 删库
TRUNCATE TABLE boys


