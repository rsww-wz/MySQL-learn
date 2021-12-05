# 存储过程
/*
含义：一组预先编译好的SQL语句的集合，理解成批处理语句
好处
	提高代码的重用性
	简化操作
	减少了编译次数并且减少了和数据库服务器的连接次数，提高效率
	
创建
	create procedure 存储过程名(参数列表)
	begin
		存储过程体(sql语句)
	end

	参数列表包含的三部分：参数模式 参数名  参数类型
	参数模式
		in:该参数可以作为输入，也就输入传入值
		out：该参数可以作为输出，也就是返回值
		inout：即可以作为输入，也可以作为输出

	如果存储过程只有一句话，可以省略begin end
	begin end 的作用就好像是花括号
	存储过程体中的每条SQL语句必须加分号结束
	存储过程的结尾可以使用delimiter 结束标记

调用
	call 存储过程名(实参列表)
	
删除
	drop procedure 存储过程名
	
查看
	desc 存储过程
*/

# 空参列表
# 插入到admin表中五条记录
SELECT * FROM admin;
DELIMITER $
CREATE PROCEDURE myp1()
BEGIN
	INSERT INTO admin(username,PASSWORD) 
	VALUES('john','0000'),('lili','0001'),('lucy','0002'),('rose','0003'),('tom','0004');
END $


# 调用
DELIMITER $
CALL myp1()$;


# 根据女神名，查询对应的男神信息
DELIMITER $
CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN
	SELECT bo.*
	FROM boys bo
	RIGHT JOIN beauty ON bo.id = bo.boyfriend_id
	WHERE b.name = beautyName;
END $

# 调用
CALL myp2('柳岩') 


# out模式
# 根据女神名，返回对应的男神名
DELIMITER $
CREATE PROCEDURE myp3(IN beautyName VARCHAR(20),OUT boyName VARCHAR(20))
BEGIN
	SELECT bo.boyName INTO boyName
	FROM boys bo
	INNER JOIN beauty AS b
	ON bo.id = b.boyfriend_id
	WHERE b.name = beautyName;
END $

# 调用
# 如果有返回值需要
SET @bName$
CALL myp3('柳岩',@bName)$
SELECT @bName$

# inout模式
# 插入a，b两个值，最终a，b都翻倍并返回
DELIMITER $
CREATE PROCEDURE myp4 (INOUT a INT,INOUT b INT)
BEGIN
	SET a=a*2;
	SET b=b*2;
END $

# 调用
SET @m=10;
SET @n=8;
CALL myp4(@m,@n);
SELECT @m,@n;

DESC myp1;