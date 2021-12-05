/*
调用
	select 函数名(实参列表) 【from 表】
分类
	单行函数
		普通的函数
	分组函数
		做统计使用，又称为统计函数，组函数

单行函数
	字符函数
	数字函数
	日期函数
	其他函数
	流程控制函数


*/

# 字符函数

# length 获取参数值的字节长度，和Go语言的len一样
SELECT LENGTH("hello world");
SELECT LENGTH("hello,你好");

# concat 拼接字符串
SELECT CONCAT(last_name,'_',first_name) FROM employees;

# upper,lower:全部变
SELECT UPPER('hello');
SELECT LOWER('HELLO');

# 函数嵌套
SELECT CONCAT(UPPER(last_name),LOWER(first_name)) AS 姓名 FROM employees;

# substr、substring（位置，长度，）；返回索引后面的字符
# 索引都是从1开始的,单位是字符，不是字节
SELECT SUBSTR("hello world",7) AS out_put
SELECT SUBSTR("hello world",7,2) AS out_put
SELECT SUBSTR("返回索引后面的字符",7,2) AS out_put

# 姓名中首字符大写，然后其他字符小写拼接
SELECT CONCAT(UPPER(SUBSTR(first_name,1,1)),'_',LOWER(CONCAT(last_name,2)))
FROM employees;

# instr(str) 返回字符串第一次出现的起始索引，如果找不到，返回0
SELECT INSTR("hello world","wo") AS out_put;

# trim 默认去除前后空白，如果指定字符，去除前后指定字符
SELECT TRIM("  hello world   ") AS out_put;
# select length(trim("  hello world   ")) as out_put;
SELECT TRIM("a" FROM "aaahello worldaaa") AS out_put;

# lpad(str,len,str)
SELECT LPAD("王二狗",10,"*") AS output;
SELECT LPAD("王二狗",2,"*") AS output;

# replace(str,str,str) 替换
SELECT REPLACE("hello world","hello","Good") AS out_put;


# 数学函数


# round(数字,保留小数位数) 四舍五入
SELECT ROUND(3.14);
SELECT ROUND(3.64);
SELECT ROUND(3.6354,3);

# ceil 向上取整
SELECT CEIL(1.1);
SELECT CEIL(1.9);

# floor 向下取整
SELECT FLOOR(1.1);
SELECT FLOOR(1.9);

# truncate 截断,不四舍五入
SELECT TRUNCATE(1.65,1);


# mod(被除数，除数)取余，返回余数
SELECT MOD(10,2);
SELECT MOD(10,3);


# 日期函数

#now 返回当前系统日期+时间
SELECT NOW();

# curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

# curtime 返回当前时间，不包含日期
SELECT CURTIME();

# 获取指定部分
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

# 返回月份的英文
SELECT MONTHNAME(NOW());

# str_to_date:格式化时间
# %Y 四位年份
# %y 两位年份
# %m 月份（补零）
# %c 月份
# %d 日
# %H 24小时
# %h 12小时
# %i 分钟(补零)
# %s 秒（补零）


SELECT STR_TO_DATE('2001-11-23',"%Y-%c-%d");

# 查询入职日期为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');

# date_format:时间转字符串
SELECT DATE_FORMAT(NOW(),'%Y %m %d');


# 其他函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER();


# 流程控制函数


# if(表达式，是，否)：类似三元运算符
SELECT IF(10 > 5,89,34);


# case语句
/*
case 要判断的字段或表达式
when 常量1 then 要显示的值或者语句1
……
else 要显示的值或者语句n;
end

*/
# 查询员工的工资
# 部门号=30，显示工资为1.1倍
# 部门号=40，显示工资为1.2倍
# 部门号=50，显示工资为1.3倍
# 其他部门，显示原工资

SELECT salary AS 原始工资, department_id,
CASE department_id
WHEN 30 THEN salary * 1.1
WHEN 40 THEN salary * 1.2
WHEN 50 THEN salary * 1.3
ELSE salary
END AS 新工资
FROM employees;

# 查询员工的工资情况
# 如果工资>20000，显示A级别
# 如果工资>15000，显示B级别
# 如果工资>10000，显示C级别
# 否则，显示D级别

SELECT salary,
CASE 
WHEN salary > 20000 THEN 'A'
WHEN salary > 15000 THEN 'B'
WHEN salary > 10000 THEN 'C'
ELSE 'D'
END AS 等级
FROM employees;


