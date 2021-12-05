/*
库的管理


创建
	create database 库名
	create database if not exists 库名
修改
	库基本不用修改
	如果修改了有可能发生崩溃，导致数据丢失
	
	如果要修改库名，不能用语法修改，只能找到本地文件夹，手动修改
	
	修改库的字符集
		alter database books character set gbk;
	
删除	
	drop databse if exists 库名
	
注意
	创建和删除重复执行都会报错
	最后加上if语句
*/

# 创建books库
CREATE DATABASE books;

# 如果表不存在就创建，如果存在就不处理
CREATE DATABASE IF NOT EXISTS books;


# 库的修改
# 修改库的字符集、
ALTER DATABASE books CHARACTER SET gbk;


# 库的删除
DROP DATABASE books;
DROP DATABASE IF EXISTS books;




