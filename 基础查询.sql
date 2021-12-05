#  DQL语句 —— 关键字 —— select语句

#  基础查询
/*
语法：
select 查询列表 from 表名

1.查询列表可以是：
    表中的字段
    常量
    表达式
    函数
    
2.查询的结果是：一个虚拟的表格

3.如果字段和关键字重名，可以用返单引号引起来（着重号）

4.执行那条命令就选中那条命令，不会执行其他命令，格式化也是一样

5.没有字符和字符串的概念，统一都用单引号（双引号也可以）

6. 起别名
    select 字段 as 别名
    as可以用空格代替

*/

# 打开库
USE myemployees;

# 查询表中的一个字段
SELECT last_name FROM employees;

# 查询表中的多个字段
SELECT last_name,salary,email FROM employees;

# 查询表中的所有字段 
# * 是通配符，顺序和表中的顺序一样，不能更改
SELECT * FROM employees;

# 查询常量值
SELECT 100;
SELECT 'hello world';

# 查询表达式
SELECT 100 * 2;

# 查询函数
SELECT VERSION();

# 起别名:方式1：使用as
SELECT 100 * 2 AS mul;
SELECT last_name AS 姓,first_name AS 名 FROM employees;

# 起别名:方式2：使用空格
SELECT last_name 姓,first_name 名 FROM employees;

# 去重
SELECT DISTINCT department_id FROM employees;

# +号的作用
/*
只有运算符功能
1.当操作数都为数值型，做加法运算
2.当其中一个操作数为字符型，会视图把字符型转化成数字型
	如果转化成功，继续做加法运算
	如果转化失败，将字符型转化为0
	只要一方为null，结果肯定为null
*/

# 字符串的拼接：concat()函数
SELECT CONCAT ('a','b','c') AS 结果;
SELECT CONCAT(last_name,first_name) AS 姓名 FROM employees;

# 任何值和null拼接的结果都是null
# 判断null函数：IFNULL(expr1,expr2)
# 如果expr1的值为null，则使用expr2的值

SELECT IFNULL(commission_pct,0) AS 奖金率,commission_pct FROM employees;


