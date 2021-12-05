/*
分组函数分类
	sum:求和
	avg:平均值
	max:最大值
	min:最小值
	count：计数
	
特点
支持的参数类型
	sum,avg:一般只能用于处理数值型
	max，min，count:可以处理任何类型
	
是否忽略null值
	都忽略null值，null值不参与运算

可以和distinct关键字搭配使用
	达到去重的效果
	
count函数
	作用：
		一般用来统计行数
	效率：
		myisam存储引擎下：count(*)的效率高
		innodb存储引擎下，count(*)和count(1)的效率差不多，比count(字段)要高一些
	
和分组函数一同查询的字段有限制
	和分组函数一同查询的字段要求是 group by后的字段
	不能是其他字段
*/

SHOW DATABASES;

USE myemployees;


# sum函数
SELECT SUM(salary) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT MIN(salary) FROM employees;

SELECT COUNT(salary) FROM employees;


# 和distinct搭配

SELECT SUM(DISTINCT salary),SUM(salary) FROM employees;
SELECT COUNT(DISTINCT salary),COUNT(salary) FROM employees;

# count函数
SELECT COUNT(salary) FROM employees;

# 统计行数
SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;
SELECT COUNT("任何类型") FROM employees;


# 和分组函数一同查询的字段有限制
SELECT AVG(salary),employee_id FROM employees;  # employee_id没有意义


# 查询员工表中的最大入职时间和最小入职时间的相差天数
# 求时间差：datediff
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) AS 相差天数
FROM employees;

# 查询部门编号为90的员工个数
SELECT COUNT(*)
FROM employees
WHERE department_id = 90;




