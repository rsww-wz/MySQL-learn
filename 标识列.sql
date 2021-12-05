/*
标识列右称为自增长列
含义：可以不用手动的插入值，系统提供默认的序列值

特点
	标识列不一定要和主键搭配，但是要求是一个key
	一个表最多只能有一个标识列
	标识列的类型只能是数值
	通过set设置步长
	也可以手动插入值，设置起始值
	
修改表示设置标识列
	
*/

# 创建表示设置标识列
CREATE TABLE tab_identeify(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20)

);

INSERT INTO tab_identeify VALUES (NULL,'lili');
INSERT INTO tab_identeify(NAME) VALUES ('lucy');

SELECT * FROM tab_identeify;

# 设置步长
SET auto_increment_increment = 3;
# 查看变量
SHOW VARIABLES LIKE '%auto_increment%';


# 修改表时设置标识列
ALTER TABLE tab_identeify MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

# 修改表时删除标识列
ALTER TABLE tab_identeify MODIFY COLUMN id INT;





