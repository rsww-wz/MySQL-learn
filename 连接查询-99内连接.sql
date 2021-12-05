# sql99语法
/*
内连接
外连接
交叉连接

语法
	select 查询列表
	from 表1 别名 【连接类型】
	join 表2 别名 
	on 连接条件
	【where 筛选条件】
	【group by 分组】
	【having 筛选条件】
	【order by 排序列表】
	
	
连接类型
	内连接：inner
	左外连接：left 【outer】
	右外连接：right 【outer】
	全外连接：full 【outer】
	交叉连接：cross
	

*/

# 内连接 - 等值连接

# 查询员工名，部门名
SELECT last_name,department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.`department_id` = d.`department_id`;


# 查询名字中包含e的员工名和工种名
SELECT last_name,job_title
FROM employees AS e
INNER JOIN jobs AS j
ON e.`job_id` = j.`job_id`
WHERE last_name LIKE "%e%";


# 查询那个部门的部门员工个数>3的部门名和员工个数，并按个数降序
SELECT city,COUNT(*)
FROM departments AS d
INNER JOIN locations AS l
ON d.`location_id` = l.`location_id`
GROUP BY city
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;


# 查询哪个部门的员工个数>3的部门名和员工个数，并按个数降序（添加排序）
SELECT COUNT(*),department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.`department_id` = d.`department_id`
GROUP BY department_name
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;


# 查询员工名，部门名，工种名，并按部门降序(三表连接)
SELECT last_name,department_name,job_title
FROM employees AS e
INNER JOIN departments AS d
ON e.`department_id` = d.`department_id`
INNER JOIN jobs AS j
ON e.`job_id` = j.`job_id`
ORDER BY department_name DESC;


# 内连接 - 非等值连接

# 查询员工的工资级别
SELECT salary,grade_level
FROM employees AS e
INNER JOIN job_grades AS g
ON e.salary BETWEEN g.`lowest_sal` AND g.`highest_sal`
ORDER BY grade_level DESC;


# 查询工资级别的个数>20的个数，并且按工资级别降序
SELECT COUNT(*),grade_level
FROM employees AS e
JOIN job_grades AS g
ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`
GROUP BY grade_level
HAVING COUNT(*) > 20
ORDER BY COUNT(*) DESC;


# 内连接 - 自连接
# 查询员工的名字，上级的名字
SELECT e.last_name,m.last_name
FROM employees AS e
JOIN employees AS m
ON e.`manager_id` = m.`employee_id`;


