/*
最难的查询

含义
子查询：出现在其他语句中的se1ect语句，称为子查询或内查询，也就是其他语句嵌套了select语句
主查询：外部的查询语句
	
分类
按子查询出现的位置分类
	select语句后面
		仅仅支持标量子查询
		
	from后面
		表子查询
		
	where和having后面（重点）
		标量子查询
		列子查询		
		行子查询（用的很少）
		
	exists后面（相关子查询）
		表子查询
	
按结果集的行列数不同
	标量子查询：结果集只有一列一行
	列子查询：结果集有一列多行
	行子查询：结果集有一行多列
	表子查询：结果集一般为多行多列
*/

/*
where或者having后面
	标量子查询（单行查询）
	列子查询（多行子查询）
	
	行字查询（多列多行）
	
特点
	子查询放在小括号内
	子查询一般放在条件右侧
	标量子查询，一般搭配单行操作符使用
	
	列子查询，一般搭配多行操作符使用（in,any,some,all）
	
	子查询的执行都是先与主查询的条件执行
	主查询的条件用到了子查询的结果
	
非法使用标量子查询
	子查询结果不是一行一列
*/

# 标量子查询
# 谁的工资比Abel高

# 查询Abel工资
SELECT salary
FROM employees
WHERE last_name = 'Abel';


# 查询员工信息，满足salary大于Abel结果
SELECT *
FROM employees
WHERE salary > (
	SELECT salary
	FROM employees
	WHERE last_name = 'Abel'
);


# 返回job_id与141号员工相同，salary比143员工多的员工姓名，job_id和工资
SELECT last_name,job_id,salary
FROM employees
WHERE job_id = (
	SELECT job_id
	FROM employees
	WHERE employee_id = 141
)AND salary > (
	SELECT salary
	FROM employees
	WHERE employee_id = 143
);


# 返回公司工资最少的员工的last_name,job_id 和salary
SELECT last_name,job_id,salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees
);

# 查询最低工资大于50号部门最低工资的部门id和其最低工资

# 1.查询50号部门的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

# 2. 查询每个部门的最低工资
SELECT MIN(salary),department_id
FROM employees
GROUP BY department_id;

# 3. 筛选，满足min(salary) > 1
SELECT MIN(salary),department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);
