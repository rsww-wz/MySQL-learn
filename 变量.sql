/*
系统变量
	全局变量
	会话变量
	
自定义变量
	用户变量
	局部变量
*/

# 全局变量
/*
系统变量：变量由系统提供，不是用户定义，属于服务器层面
查看
	查看所有系统变量:show variables;	
	查看全局变量:show global variables
	查看会话变量:show session variables
	
	查看满足条件的系统变量：show globle variables like '条件'
	查看具体全局变量：select @@global.系统变量名
	查看具体会话变量：select @@session.系统变量名
	
赋值
方式1
	set global 系统变量 = 值
	set session 系统变量 = 值
	
方式2
	set @@global.系统变量名 = 值
	set @@session.系统变量名 = 值
	
注意：默认是session变量

作用域
	全局变量：服务器每次启动将会为所有的全局变量赋初始值，针对于所有的会话(连接)有效，但不能跨重启
	会话变量：仅仅针对于当前会话有效
*/

# 自定义变量
/*
用户变量
	针对于当前会话有效，同于会话变量的作用域
	可以定义在任何地方
	
声明并初始化
	方式1：set @用户变量名 = 值
	方式2：set @用户变量名 := 值
	方式3：select @用户变量名 := 值

赋值(更新用户变量的值)
	方式1：set @用户变量名 = 值
	方式2：set @用户变量名 := 值
	方式3：select @用户变量名 := 值
	方式4：select 字段 into 变量名

使用
	查看：select @用户变量名


局部变量
	仅仅在定义的begin end中有效
	而且只能放在begin end中的第一句话
	
声明：declare 变量名 类型
赋值：同用户变量
查看：select 局部变量名


*/

# 全局变量
# 查看变量

SHOW VARIABLES;
SHOW GLOBAL VARIABLES;
SHOW SESSION VARIABLES;

# 修改变量
SET auto_increment_increment = 1;


# 用户变量
# 声明两个变量并赋值求和
SET @m=100;
SET @n=34;
SET @sum= @m + @n;
SELECT @sum;

# 局部变量
BEGIN
DECLARE m INT DEFAULT 4;
DECLARE n INT DEFAULT 8;
DECLARE SUM INT;
SET SUM = m + n;
SELECT SUM;
END