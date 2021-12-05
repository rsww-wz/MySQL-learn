# TCL语言
/*
transaction control language 事务控制语言

事务
	一个或者一组sql语句组成一个执行单元，这个执行单元要么全部执行，要么全部不执行
	
	案例
		如果某一条sql语句，出现错误，或者数据库出现异常，导致一部分sql数据执行成功，有一部分sql语句执行失败
		会导致数据的不可靠，破坏数据的完整性
		所以需要要么全部执行成功，要么全部失败，保证数据的可靠性
		
		如果执行失败，整个单元将会回滚，回到最初的状态
		如果执行成功，则事物被顺利执行
		
	注意
		不是所有的存储引擎到支持事物
		
事物的ACID属性
	原子性
		原子性是值无误是一个不可分割的工作单位，事物中的操作要么都发生，要么都不发生
	一致性
		事务必须使数据库从一个一致性状态变换到另外一个一致性状态
	隔离性
		事务的隔离性是指一个事务的执行不能被其他事务干扰，即一事务内部的操作及使用的数据对并发的其他事务是隔离的
		并发执行的各个事务之间不能互相干扰
	持久性
		持久性是指一个事务一旦被提交，它对数据库中数据的改变就是
		永久性的，接吓来的其他操作和数据库故障不应该对其有任何影响
		
事物的分类
	隐式事物
		事物没有明显的开启和结束标记
		比如insert，update，delete语句等
	显式事物
		事物具有明显的开始和结束标记
		前提：必须先设置自动提交功能为禁用

		
设置开启事物
	set autocommit = 0 (必须)
	start transaction  (可选)
	
结束事物
	提交事物(没错)：commit
	回滚事物(有错)：rollback
	
	理解结束事物之前，只是将数据保证到内存，并没有保证到数据库中
	
数据库并发问题
	脏读
		对于两个事务T1，T2，T1读取了已经被T2更新但还没有被提交的字段之后，
		若T2回滚，T1读取的内容就是临时且无效的
	不可重复读
		不可重复读：对于两个事务T1，T2，T1读取了一个字段然后T2更新了该字段之后
		T1再次读取同一个字段，值就不同了
	幻读
		幻读于两个事务T1，T2，T1从一个表中读取了一个字段，然后T2在该表中插些新的行之后
		如果T1再次读取同一个表，就会多出几行
		
	数据库事务的隔离性：数据库系统必须具有隔离并发运行各个事务的能力使它们不会相互影响，避免各种并发问题
	每种数据都支持自己的隔离级别，MySQL中，支持4种隔离级别
	
事物隔离级别
				脏读		不可重复度	幻读	
	read uncommitted	√		√		√
	read committed		×		√		√
	repeatable read		×		×		√
	serializable		×		×		×
	
	
	MySQL中默认第三个隔离级别：repeatable read
	
查看隔离级别
	select @@tx_isolation
设置隔离级别
	set session|global transaction isolation level 
*/

CREATE TABLE account(
	id INT,
	username VARCHAR(20),
	balance INT
);

INSERT INTO account (id,username,balance)
VALUES(1,'张无忌',1000),
	(2,'赵敏',1000);


# 开启事物
SET autocommit = 0;
START TRANSACTION;
UPDATE account SET balance = 2000 WHERE unsername = '张无忌';
UPDATE account SET balance = 3000 WHERE unsername = '赵敏';
COMMIT;
ROLLBACK;

SELECT * FROM account;


# delete和truncate在事物使用时的区别
# delete语句支持回滚，truncate语句不支持回滚，会直接删除数据库的数据

# delete
SET autocommit = 0;
START TRANSACTION;
DELETE FROM account;
ROLLBACK;

# truncate
SET autocommit = 0;
START TRANSACTION;
TRUNCATE TABLE account;
ROLLBACK;


# savepoint 结点名：设置保存点
# 只能搭配rollback使用
SET autocommit = 0;
START TRANSACTION;
DELETE FROM account WHERE id = 1;
# 设置保存点
SAVEPOINT a;
DELETE FROM account WHERE id = 2;

# 回到保存点
ROLLBACK TO a;


SELECT * FROM account;





