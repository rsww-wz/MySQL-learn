# 视图
/*
含义：虚拟表，和普通表一样使用
mysql 5.1版本出现的新特性，是通过表动态生成数据

理解
	一个班级就是一个表
	从每个班级中选出一些人组音乐班，这个音乐班就是视图，是一个临时的班

	行和列的数据自定义视图的查询中使用的表，并且是在使用视图时动态生成的，只保存了sql逻辑，不保存查询结果
	
理解
	类似于函数，创建一个视图，保留sql语句，然后每次要执行相同的功能，就使用视图即可
	类似函数的调用
	也可以理解为给查询语句起了个别名
	
应用场景
	多个地方用到相同的查询结果
	该查询结果使用的sql语句比较复杂
	
创建视图
	create view 视图名
	as
	查询语句
	
	视图可以嵌套
	
视图的修改
方式1
	create or replace view 视图名
	as 
	查询语句
	
方式2
	alter view 视图名
	as
	查询语句
	
删除视图
	drop view 视图名，视图名....
	
查看视图
	desc 视图名
	
视图的更新（很少这样做，视图一般只允许读，不允许写，所以就不学不能更新的具体情况了）
	插入
	修改
	删除
*/

# 查询邮箱中包含a字符的员工名，部门名和工种信息
USE myemployees;

CREATE VIEW myv1
AS

SELECT last_name,department_name,job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON j.job_id = e.job_id;

# 使用视图
SELECT * FROM myv1 WHERE last_name LIKE '%a%';



# 创建视图emp，要求查询电话号码以011开头的员工姓名和工资，邮箱
CREATE VIEW emp
AS

SELECT last_name,salary,email
FROM employees AS e
WHERE phone_number LIKE '011%';




