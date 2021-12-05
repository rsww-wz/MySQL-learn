# 外连接
/*
应用场景：一个表中有，另一个表中没有的记录
特点
	外连接的查询结果为主表中的所有记录
		如果从表中有和他匹配的，则显示匹配的值
		如果从表中没有和他匹配的，则显示null
		外连接查询结果=内连接结果+主表中有而从表没有的记录
	左外连接
		left join左边的是主表
	右外连接
		right join右边的是主表 
		
	也就是谁的表值多，谁就当主表
	
	左外和右外交换两表顺序可以实现同样效果
	
全外链接
	全外连接=内连接的结果+表1中有但表2没有的+表2中有但表1没有的

*/

# 交叉连接
/*
	使用sql99的标准是笛卡尔乘积
	实际上的效果就是笛卡尔乘积
	
*/

# 查询男朋友不在男神表的女神名

# 左外连接
SELECT b.name,bo.*
FROM beauty AS b
LEFT OUTER JOIN boys AS bo
ON b.boyfriend_id = bo.id
WHERE bo.`id` IS NULL;

# 右外连接
SELECT b.name,bo.*
FROM boys AS bo
RIGHT OUTER JOIN beauty AS b
ON b.boyfriend_id = bo.id
WHERE bo.`id` IS NULL;

# 查询那个部门没有员工
# 左外
SELECT d.*,e.employee_id
FROM departments AS d
LEFT OUTER JOIN employees AS e
ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;


# 右外
SELECT d.*,e.employee_id
FROM employees AS e
RIGHT OUTER JOIN departments AS d
ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;



# 全外链接不支持

# 交叉连接
SELECT b.*,bo.*
FROM beauty AS b
CROSS JOIN boys bo;



