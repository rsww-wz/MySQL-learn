/*
顺序结构
分支结构
循环结构

*/

# 分支结构
/*
if函数:实现简单的双分支

语法
	if(表达式1，表达式2，表达式3)
	如果表达式1成立，返回表达式2的值，否则返回表达式3的值

case语句:

情况1：用于等值判断
语法
	case 变量|表达式|字段
	when 要判断的值 then 返回的值1
	when 要判断的值 then 返回的值2
	。。。
	else 要返回的值n或者语句n
	end case
	
情况2：多分支判断区间判断
语法
	case 变量|表达式|字段
	when 要判断的条件 then 返回的值1
	when 要判断的条件 then 返回的值2
	。。。
	else 要返回的值n
	end case	
	
case语句特点
	可以作为表达式，嵌套在其他语句中使用，可以放在任何地方，begin end中或者外面
	可以作为独立的语句使用，只能放在begin end中
	
	如果when中的值满足或者条件成立，则执行对应的then后面的语句，并且结束case
	如果都不满足，则执行else中的语句或者值
	else可以省略，如果else省略了。并且所以when条件都不满足，则返回null
*/

# if结构
/*
完全和其他语言的if结构一样
语法
if 条件1 then 语句1;
elseif 条件2 then 语句2;
...
else 语句n
end if

只能用在begin end中
*/


# 循环结构
/*
分类
	while
	loop
	repaet

循环控制
	iterate 类似于continue 继续，结束本次循环，续集下一次循环
	leave   类似于break，  跳出，结束当前所在的循环


while语法
	标签可以省略，作用是给循环起名字，用跳转语句的时候比较方便
	
【标签】while 循环条件 do
	循环体;
end while【标签】;



loop语法
	可以用来模拟死循环
【标签】loop
	循环体；
end loop【标签】;



repeat语法
【标签】repeat
	循环体；
until 结束循环的条件
end repeat【标签】;
*/


# 批量插入，根据次数插入到admin表中多条记录
DELIMITER $
CREATE PROCEDURE pro_while(IN insertCount INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i<= insertCount DO
		INSERT INTO admin(username,PASSWORD)
		VALUES(CONCAT('Rose',i),'666');
		SET i=i+1;
	END WHILE;
END $

# 调用
DELIMITER $
CALL pro_while(10)$

SELECT * FROM admin;