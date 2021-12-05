# 排序查询

/*
语法
	select 查询列表
	from 表
	【where 筛选条件】
	order by 排序列表 asc|desc【升序和降序】
		asc:升序：从低到高
		desc:降序：从高到低
		
特点
	默认排序
	order by子句中可以支持单个字段、多个字段、表达式、函数、别名
	order by子句一般是放在查询语句的最后面，1imit子句除外
*/

# 查询员工信息，工资从高到低排序
SELECT *
FROM employees
ORDER BY salary DESC;

# 查询部门编号大于等于90的员工信息，按入职时间的先后进行排序
SELECT *
FROM employees
WHERE department_id >= 90
ORDER BY hiredate ASC;

# 按年薪的高低显示员工的信息，年薪【按表达式排序】
SELECT *,salary * 12 * (1 + IFNULL(commission_pct,0)) AS 年薪
FROM employees
ORDER BY salary * 12 * (1 + IFNULL(commission_pct,0)) DESC;
# ORDER BY 年薪 DESC;

# 按员工的姓名程度显示员工的姓名和工资 【按函数排序】
SELECT LENGTH(last_name) AS 姓名长度,last_name,salary
FROM employees
ORDER BY 姓名长度;

# 查询员工信息，要求先按工资排升序，再按员工编号排降序 【按多个字段排序】
SELECT *
FROM employees
ORDER BY salary ASC,employee_id DESC;

# 选择工资不在8000到17000的员工的姓名和工资，按工资降序
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC;

# 查询邮箱中包含e的员工信息，并先按邮箱的字节数降序，再按部门号升序
SELECT *,LENGTH(email) AS 字节长度
FROM employees
WHERE email LIKE '%e%'
ORDER BY LENGTH(email) DESC,department_id ASC;




