/*
常见的数据类型

数值型

整型
	Tinyint      (1字节)
	smallint     (2字节)
	mediumint    (3字节)
	int,integer  (4字节)
	bigint       (8字节)
	
	所有类型默认是有符号，无符号需要指定，用关键字unsigned
	如果插入负数，显示的是最小值，数值超过了最大范围，显示的是最大值
	长度代表了显示的最大宽度，如果不够会用0在左边填充，单必须搭配zerofill使用
	
小数
	定点数
		DEC(M,D)
		DECIMAL(M,D)  
	浮点数
		float(M,D)   (4字节)
		double(M,D)   (8字节)
		
	M,D
		M:小数的整数部分和小数部分和起来的长度，也就是整个小数的长度
		D:小数的长度
		
	float和double会根据小数的长度自动选择，DECIMAL默认长度(M)是10，小数部分(D)的长度为0
	定点数的精度较高
	
	
选择原则
	所选择的类型越简单越好
	能保存的数值的类型越小越好

*/


/*

		
字符型
	较短的文本
		char(M)
		varchar(M)
		
		M：最大字符数
		char的M可以省略，默认为1，varchar不可以省略
		
		char是不可变的，即使你只用到了2个字符，也会分配你指定的大小空间
		varchar是可变的，可以根据字符长度自动分配合适的大小
		
		char:比较耗费空间，效率高
		varchar：比较省空间，效率低
		
	较长的文本
		text
		blob(二进制文件)
		
	其他类型
		enum：枚举值
		set：集合
	
日期型
	date(4字节) ： 年月日
		
	datetime(8字节) ： 年月日，时分秒
		
	timestamp(4字节) ： 时间戳
		
	time(3字节) ： 时分秒
		
	year(1字节) ： 年份
		
	
  注意：timestamp受失去影响
	

*/

# 整型

CREATE TABLE tab_int (
	t1 INT
	t2 INT UNSIGNED
);


# 浮点型
# float(M,D)











