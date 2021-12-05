/*
列子查询

返回多行，使用多行操作符

多行操作符
in,not in:等于列表中的任意一个
any,some：和子查询返回的某一个值比较
all：和子查询返回的所有值比较

in可以换成=any
not in 可以换成 !=all


行子查询
	返回多行多列
	基本用不到，因为要求比较严格
*/


# 返回location_id是1400或者1700的部门中的所有员工姓名
# 第一步
SELECT department_id
FROM departments
WHERE location_id IN(1400,1700);

# 第二步
SELECT last_name
FROM employees
WHERE department_id IN (
	SELECT department_id
	FROM departments
	WHERE location_id IN(1400,1700)
);

# 或者 用=any代替in
SELECT last_name
FROM employees
WHERE department_id =ANY (
	SELECT department_id
	FROM departments
	WHERE location_id IN(1400,1700)
);

# 返回其他工种中比job_id为‘IT_PROG’部门任一工资低的员工的：工号，姓名，job_id以及salary
SELECT job_id,last_name,salary
FROM employees
WHERE salary < ANY (
	SELECT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id != 'IT_PROG';

# 或者
SELECT job_id,last_name,salary
FROM employees
WHERE salary < (
	SELECT MAX(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id != 'IT_PROG';


# 返回其他工种中比job_id为‘IT_PROG’部门所有工资低的员工的：工号，姓名，job_id以及salary
SELECT job_id,last_name,salary
FROM employees
WHERE salary < ALL (
	SELECT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id != 'IT_PROG';

# 或者
SELECT job_id,last_name,salary
FROM employees
WHERE salary < (
	SELECT MIN(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id != 'IT_PROG';




# 查询员工编号最小并且工资最高的员工信息

# 用列子查询
# 1.查询最小员工编号
SELECT MIN(employee_id)
FROM employees;


# 2. 查询最高工资
SELECT MAX(salary)
FROM employees;

# 3. 查询员工信息
SELECT *
FROM employees
WHERE employee_id = (
	SELECT MIN(employee_id)
	FROM employees
)AND salary = (
	SELECT MAX(salary)
	FROM employees

);

# 用行子查询
SELECT *
FROM employees
WHERE(employee_id,salary) = (
	SELECT MIN(employee_id),MAX(salary)
	FROM employees
);


# select语句后面的子查询:仅仅支持标量子查询

# 查询每个部门的员工个数
SELECT d.*,(
	SELECT COUNT(*)
	FROM employees AS e
	WHERE e.department_id = d.department_id
) AS 个数
FROM departments AS d
ORDER BY 个数 DESC;

# 查询员工号=102的部门名
SELECT (
	SELECT department_name
	FROM departments AS d
	INNER JOIN employees AS e
	ON d.department_id = e.department_id
	WHERE e.employee_id = 102
) AS 部门名;

SELECT department_name
FROM departments AS d
JOIN employees AS e
ON e.department_id = d.department_id
WHERE e.`employee_id` = 102;



# from语句后面的子查询
# 子查询的结果充当一张表，必须要求起别名


# 查询每个部门平均工资的工资等级
# 1.查询每个部门的评价工资
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id;

# 2.连接1的结果集
SELECT ag_dep.*,g.grade_level
FROM (
	SELECT AVG(salary) AS ag,department_id
	FROM employees
	GROUP BY department_id
) AS ag_dep
INNER JOIN job_grades AS g
ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;

# 放在exists语句后面（相关子查询）
/*
语法
exists(完整的查询语句)
结果：1或者0
相当于bool值

不推荐使用
*/

# exists语句
SELECT EXISTS (SELECT employee_id FROM employees);

# 查询员工名和部门名
SELECT last_name,department_name
FROM employees AS e,departments AS d
WHERE e.`department_id` = d.`department_id`;

SELECT department_name
FROM departments AS d
WHERE EXISTS (
	SELECT *
	FROM employees AS e
	WHERE d.`department_id` = e.`department_id`
);


# 使用in代替
SELECT department_name
FROM departments AS d
WHERE d.`department_id` IN (
	SELECT department_id
	FROM employees
);

# 查询没有女朋友的男神信息
SELECT bo.*
FROM boys AS bo 
WHERE bo.id NOT IN (
	SELECT boyfriend_id 
	FROM beauty
);


