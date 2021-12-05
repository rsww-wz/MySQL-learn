/*
和存储过程的区别
	函数有且只有一个返回值
	
创建
	create function 函数名(参数列表) returns 返回类型
	begin
		函数体
	end

	参数列表：参数名 参数类型
	函数体肯定会有return语句，会报错
	如何return语句没有放在函数体的最后也不会报错，但是不建议
	函数体中只有一句话时，可以省略begin end语句
	使用delimiter语句设置结束标记

	注意结束标记是整个delimiter语句，不只是后面的符号
	
调用
	select 函数名(参数列表)
	
查看函数
	show create function 函数名
	
删除函数
	drop function 函数名
*/

# 无参数有返回
# 返回公司的员工个数
DELIMITER $
CREATE FUNCTION myf1() RETURNS INT
BEGIN
	DECLARE c INT DEFAULT 0 # 定义变量
	SELECT COUNT(*) INTO c   # 赋值
	FROM employees
	RETURN c;
END $

# 调用

SELECT myf1()

# 有参有返回
DELIMITER $
CREATE FUNCTION myf2(empName VARCHAR(20)) RETURNS DOUBLE
BEGIN
	SET @sal=0;  # 定义用户变量
	SELECT salary INTO @sal  # 赋值
	FROM employees
	WHERE last_name = empName;
	RETURN @sal;
END $

# 调用
SELECT myf2('Kochhar') $


# 根据部门名，返回该部门的平均工资
DELIMITER $
CREATE FUNCTION myf3(deptName VARCHAR(20)) RETURNS DOUBLE
BEGIN
	DECLARE sal DOUBLE;
	SELECT AVG(salary) INTO sal
	FROM employees AS e
	JOIN departments d ON e.department_id = d.department_id
	WHERE d.department_name = deptName;
	RETURN sal;
END $

SELECT myf3('IT')$


# 传入两个float，返回两者之和
DELIMITER $
CREATE FUNCTION myf4(a FLOAT,b FLOAT) RETURNS FLOAT
BEGIN
	SET @sum=0;
	SET @sum = a + b;
	RETURN @sum;
END $

SELECT myf4(4.3,8.2);
