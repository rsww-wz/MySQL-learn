// 连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接

笛卡尔乘积
	现象：表1有m行，表2有n行
	结构：有m * n行
	发生原因：没有有效的连接条件
	如何避免：添加有效的连接条件

原理
	也是在笛卡尔乘积的基础上，然后根据连接条件进行筛选

分类
	按年代分类
		sql192标准：只支持内连接
		sql199标准【推荐】：支持内连接+外连接（左外+右外）+交叉连接
		
	按功能分类
		内连接
			等值连接
			非等值连接
			字连接
		外连接
			左外连接
			右外连接
			全外连接
		交叉连接


添加条件
	需要用表名.字段


等值连接总结
	多表等值连接的结果为多表的交集部分
	n表连接，至少需要n-1个连接条件
	多表的顺序没有要求
	一般需要为表起别名
	可以搭配前面介绍的所有子句使用，比如排序、分组、筛选

*/

# 笛卡尔乘积
SELECT NAME,boyfriend_id
FROM boys,beauty;



# sql192标准
# 等值连接
# 查询女神名和对应的男神名
SELECT NAME,boyfriend_id
FROM boys,beauty
WHERE beauty.boyfriend_id = boys.id;

# 查询员工名和对应的部门名
SELECT last_name,department_name
FROM employees,departments
WHERE employees.department_id = departments.department_id;

# 为表起别名
#	提高语句简洁度
#	区分多个重名字段
# 注意：如果为表起了别名，则查询的字段就不能使用原来的表名去

# 查询员工名、工种号、工种名
SELECT last_name,e.job_id,job_title
FROM employees AS e,jobs AS j
WHERE e.job_id = j.job_id;

# 添加添加用and
# 查询有奖金的员工名、部门名
SELECT last_name,department_name,commission_pct
FROM employees AS e, departments AS d
WHERE e.`department_id`= d.`department_id`
AND e.`commission_pct` IS NOT NULL;


# 查询城市名中第二个字符为0的部门名和城市名
SELECT department_name,city
FROM departments AS d,locations AS l
WHERE d.`location_id` = l.`location_id`
AND city LIKE '_o%';


# 添加分组
# 查询每个城市的部门个数
SELECT COUNT(*) AS 个数,city
FROM departments AS d,locations AS l
WHERE d.`location_id` = l.`location_id`
GROUP BY city;

# 查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name,d.manager_id,MIN(salary)
FROM departments AS d,employees AS e
WHERE d.`department_id` = e.`department_id`
AND e.`commission_pct` IS NOT NULL
GROUP BY department_name,d.manager_id;


# 添加排序
# 查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT job_title,COUNT(*)
FROM jobs AS j,employees AS e
WHERE j.`job_id` = e.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;


# 多表连接
# 询员工名、部门名和所在的城市
SELECT last_name,department_name,city
FROM employees AS e,departments AS d,locations AS l
WHERE e.`department_id` = d.`department_id`
AND d.`location_id` = l.`location_id`;












