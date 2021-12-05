/*
分组查询

前提
	是建立在分组函数的基础之上的

语法
	select 分组函数，列(要求出现在group by的后面)
	from 表
	【where 筛选条件】
	group by 分组的列表
	【order by 子句】

	having 是分组后的筛选条件

筛选
	分组查询的筛选条件分为两类
				数据源		位置		关键字
		分组前筛选	原数据		group by前面	where
		分组后筛选	分组后的结果集  group by后面	having
		
	分组函数做条件肯定是放在having语句中
	能用分组前筛选的就尽量使用分组前筛选
	
总结
	group by 支持单个字段分组，也支持多个字段分组，并且没有顺序要求
	也可以添加排序，放在整个分组的后面
*/

# 查询每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id;

# 查询每个工种的最高工资
SELECT MAX(salary),job_id
FROM employees
GROUP BY job_id;


# 查询每个位置的上的部门个数
SELECT COUNT(*),location_id
FROM departments
GROUP BY location_id;


# 添加筛选条件
# 查询邮箱中包含a字符的，每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;


# 有奖金的每个领导手下员工的最高工资
SELECT MAX(salary) AS 最高工资,manager_id AS 领导
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY 领导;


# 添加复杂的筛选条件：添加分组后的筛选

# 查询那个部门的员工个数>2
	# 查询每个部门的员工个数
	# 根据上述结果进行筛选，查询那个部门的员工个数>2
	
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;


# 查询每个工种有奖金的最高工资>12000的工种编号和最高工资
SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 12000;


# 查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资
SELECT manager_id,MIN(salary)
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING MIN(salary) > 5000;


# 按表达式或函数分组
# 按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
SELECT COUNT(*),LENGTH(last_name) AS 姓名长度
FROM employees
GROUP BY 姓名长度 
HAVING COUNT(*) > 5;


# 按多个字段分组
# 查询每个部分每个工种的员工的评价工资
SELECT AVG(salary),department_id,job_id
FROM employees
GROUP BY department_id,job_id; # 顺序可以调换

# 添加排序
# 查询每个部分每个工种的员工的评价工资，并且按平均工资降序
SELECT AVG(salary),department_id,job_id
FROM employees
GROUP BY department_id,job_id
ORDER BY AVG(salary) DESC;


SELECT AVG(salary),department_id,job_id
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id,job_id
HAVING AVG(salary)>10000
ORDER BY AVG(salary) DESC;


# 查询所有部门的编号，员工数量和工资平均值，并按平均工资降序
SELECT department_id,COUNT(*),AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

# 选择具有各个 job_id的员工人数
SELECT COUNT(*),job_id
FROM employees
GROUP BY job_id;


