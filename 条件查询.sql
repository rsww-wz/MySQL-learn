/*
条件查询语法

select
	查询列表
from
	表名
where
	筛选条件;
	

分类
	按条件表达式筛选
		条件运算符
			不等于：<> 也可以用！=
			等于：=，或者<=>
			其他运算符一样
		
	逻辑表达式
		逻辑运算符
			支持：&&，||，！
			推荐使用：and,or,not
			
	模糊查询
		like
		between and
		in
		is null



*/

# 按条件表达式筛选
# 查询工资大于12000的员工信息
SELECT
	*
FROM
	employees
WHERE
	salary > 12000;
	

# 查询部门编号不等于90号的员工名和部门编号
SELECT
	last_name,
	department_id
FROM
	employees
WHERE
	#department_id != 90;
	department_id <> 90;

# 按逻辑表达式查询
# 逻辑表达式的作用就是连接条件表达式

# 查询工资在10000到20000之间的员工名，工资和奖金
SELECT 
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE
	# salary between 10000 and 20000;
	salary >= 10000 AND salary <= 20000;
	
# 查询部门编号不是在90到110之间或者工资高于15000的员工信息
SELECT
	*
FROM
	employees
WHERE
	#(department_id not between 90 and 110) or salary > 15000;
	NOT (department_id >= 90 AND department_id <= 110) OR salary > 15000;
	

# 模糊查询
/*
like
	一般和通配符搭配使用
		%：任意多个字符，包含零个字符
		_:任意单个字符
		
between and 
	连接的两个值可以不可以颠倒循序
	可以代替部分逻辑语句和条件语句的组合表达式，而且更加简洁

in
	用于判断某字段的值是否属于in列表中的一项
	比使用or简洁
	in列表中的值类型必须一致或者兼容
	in的作用相当于等于号，in里面的类型必须完整，不能使用通配符

is null
	<>或者！=，不能用于判断null值
	is null 和is not null 可以判断null值
	可以用<=>判断null值，也可以判断其他数值，但是is null只能判断null值
	但是还是不推荐使用<=>，因为可读性差
*/

# 查询员工名中包含字符a的员工信息
SELECT
	*
FROM
	employees
WHERE
	last_name LIKE '%a%';

# 查询员工中第三个字符为n，第五个字符为l的员工名和工资
SELECT
	last_name,
	salary
FROM 
	employees
WHERE
	last_name LIKE '__n_l%';
	
# 查询员工名中第2个字符为下划线的员工名
SELECT
	last_name
FROM 
	employees
WHERE
	# last_name like '_\_%';
	last_name LIKE '_$_%' ESCAPE '$';
	# 转移字符默认是反斜杠，但是可以指定任意字符为转移字符，后面escape指定字符即可

# 查询员工编号在100到120之间的员工信息
SELECT
	*
FROM 
	employees
WHERE
	employee_id BETWEEN 100 AND 120;
	
# 查询员工工种编号是IT_PROG,AD_VP,AD_PRES中的一个员工名和工种
SELECT
	last_name,
	job_id
FROM 
	employees
WHERE
	# job_id = 'IT_PROG' or job_id = 'AD_VP' or job_id = 'AD_PRES';
	job_id IN('IT_PROG','AD_VP','AD_PRES');

# 查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL;

# 查询有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;

# 查询员工号为176的员工的姓名和部门号和年薪
SELECT
	last_name,
	department_id,
	salary * 12 #(1 + ifnull(commission_pct,0)) as 年薪
FROM
	employees
WHERE
	employee_id = 176;
