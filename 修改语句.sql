# 修改语句
/*
语法

1. 修改单表记录（重点）
	update 表名
	set 列 = 值,...
	where 筛选条件



2. 修改多表记录（补充）
192语法
	update 表1 别名,表2 表名
	set 列 = 值
	where 连接条件
	and 筛选条件；

199语法
	update 表1 别名
	inner/left/right join 表2 别名
	on 连接条件
	set 列 = 值
	where 筛选条件
*/

SELECT * FROM beauty;

# 修改单表记录
# 修改beauty表中姓唐的女神的电话为1389988899

UPDATE beauty SET phone = '1389988899'
WHERE NAME LIKE '唐%';

# 修改boys表中id=2的名称为张飞，魅力值为100
UPDATE boys SET boyname='张飞',usercp = 100
WHERE id = 2;

SELECT * FROM boys;


# 修改多表记录

# 修改张无忌的女朋友的手机号为114
UPDATE boys AS bo
INNER JOIN beauty AS b 
ON bo.`id` = b.`boyfriend_id`
SET b.`phone` = '114'
WHERE bo.`boyName` = '张无忌';


# 修改没有男朋友的女神的男朋友编号都为2
UPDATE boys AS bo
RIGHT JOIN beauty AS b
ON bo.`id` = b.`boyfriend_id`
SET bo.`id` = 2
WHERE bo.`id` IS NULL;











