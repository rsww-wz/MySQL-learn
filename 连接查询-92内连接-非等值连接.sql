/*
非等值连接就是把等值连接的筛选条件的等于号换成不等号


自连接



*/

# 添加准备数据（不用管）
CREATE TABLE job_grades
(grade_level VARCHAR(3),
lowest_sal INT,
highest_sal INT);

INSERT INTO job_grades
VALUES ('A',1000,2999);

INSERT INTO job_grades
VALUES ('B',3000,5999);

INSERT INTO job_grades
VALUES ('C',6000,9999);

INSERT INTO job_grades
VALUES ('D',10000,14999);

INSERT INTO job_grades
VALUES ('E',15000,24999);

INSERT INTO job_grades
VALUES ('F',25000,40000);

SELECT * FROM job_grades;

# 查询员工的工资和工资级别
SELECT salary,grade_level
FROM employees AS e,job_grades AS g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`;

# 添加排序
SELECT salary,grade_level
FROM employees AS e,job_grades AS g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`
ORDER BY grade_level;



# 自连接
# 查询员工名和上级的名称
SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees AS e,employees AS m
WHERE e.`manager_id` = m.`employee_id`;


