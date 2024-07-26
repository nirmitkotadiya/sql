CREATE database college;
CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE IF EXISTS company;


USE college;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO student VALUES (1, "Aman",26);
INSERT INTO student VALUES (2,"Shradha",24);

SELECT * FROM student;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE student;


CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO student 
(rollno,name) 
VALUES
(101,"Arjun"),
(102,"Karan");

INSERT INTO student VALUES (201,"Ram");

-- Practice Qs 1 --

CREATE DATABASE XYZ;

USE XYZ;

CREATE TABLE emp_info
(id INT PRIMARY KEY,
name VARCHAR(50),
salary INT NOT NULL);

INSERT INTO emp_info
(id , name , salary ) 
VALUES
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

SELECT * FROM emp_info;

-- -- 

CREATE TABLE temp1(id INT UNIQUE);

INSERT INTO temp1 (id) VALUES (101);
INSERT INTO temp1 (id) VALUES (101);

SELECT * FROM temp1;


CREATE TABLE emp(
id INT,
salary INT DEFAULT 25000);

INSERT INTO emp(id) VALUES(1),(2);

SELECT * FROM emp;

-- Create a sample table -- 
-- DROP DATABASE college; -- 

CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student (rollno,name,marks,grade,city) 
VALUES
(101 ,"Anil" ,78 , "C","Pune"),
(102 ,"Bhumika" ,93, "A","Mumbai"),
(103, "Chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

SELECT name,marks FROM student;

SELECT * FROM student;

SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80;

SELECT * FROM student WHERE city = "Mumbai";

SELECT * FROM student WHERE marks > 80 OR city = "Mumbai";

SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student WHERE city IN ("Delhi","Mumbai");

SELECT * FROM student WHERE city NOT IN ("Mumbai","Delhi");

SELECT * FROM student LIMIT 3;

SELECT * FROM student WHERE marks > 75 LIMIT 3;

SELECT * FROM student ORDER BY city ASC;

SELECT * FROM student ORDER BY city DESC;

SELECT * FROM student ORDER BY marks DESC LIMIT 3;

SELECT MAX(marks) FROM student;

SELECT AVG(marks) FROM student;

SELECT COUNT(rollno) FROM student;

SELECT city ,COUNT(city) FROM student GROUP BY city;

SELECT city,name ,COUNT(city) FROM student GROUP BY city,name;

SELECT city, AVG(marks) FROM student GROUP BY city;

SELECT grade, COUNT(grade) FROM student GROUP BY grade ORDER BY grade;

SELECT city,count(name) FROM student GROUP BY city HAVING MAX(marks) > 90;

SELECT city 
FROM student 
WHERE grade="A" 
GROUP BY city 
HAVING MAX(marks) >=93 
ORDER BY city DESC;

SET SQL_SAFE_UPDATES =0;

UPDATE student SET grade ="O" WHERE grade="A";

UPDATE student SET marks=92 WHERE rollno=105;

UPDATE student SET marks=18 WHERE rollno=105;

UPDATE student SET grade="B" WHERE marks BETWEEN 80 AND 90;

DELETE FROM student WHERE marks < 33;

SELECT * FROM student;

CREATE TABLE t1(id INT) ;

INSERT INTO t1 VALUES(11),(122),(324);
SELECT * FROM t1;
DELETE FROM t1;

-- Practice Qs 2 --

SELECT city,AVG(marks) FROM student GROUP BY city ORDER BY city ASC;

CREATE TABLE payment_table (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    mode VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO payment_table (
customer_id, customer, mode, city
)
VALUES 
(101 , "Olivia Barrett" , "Netbanking" ,"Portland"),
(102 , "Ethan Sinclair" , "Credit Card" ,"Miami"),
(103 , "Maya Hernadez" , "Credit Card" ,"Seattle"),
(104 , "Liam Donovan" , "Netbanking" ,"Denver"),
(105 , "Sophia Nguyen" , "Credit Card" ,"New Orleans"),
(106 , "Caleb Foster" , "Debit Card" ,"Minneapolis"),
(107 , "Ava Patel" , "Debit Card" ,"Minneapolis"),
(108 , "Lucas Carter" , "Netbanking" ,"Boston"),
(109 , "Isabella Martinez" , "Netbanking" ,"Nashville"),
(110 , "Jackson Brooks" , "Credit Card" ,"Boston");

SELECT mode ,COUNT(mode) FROM payment_table GROUP BY mode;

-- --
 
CREATE TABLE dept (id INT PRIMARY KEY , name VARCHAR(50));

INSERT INTO dept
VALUES
(101,"english"),
(102,"IT");

SELECT * FROM dept;

SET SQL_SAFE_UPDATES = 0;

UPDATE dept SET id =103 WHERE id=102;

UPDATE dept SET id =111 WHERE id=101;

CREATE TABLE teacher (
id INT PRIMARY KEY , 
name VARCHAR(50), 
dept_id INT , 
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);


INSERT INTO teacher
VALUES 
(101,"Adam",101),
(102,"Eve",102);

SELECT * FROM teacher;

ALTER TABLE student
ADD COLUMN age INT;

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student (rollno,name,marks,student_age) 
VALUES 
(107,"gargi",68,100);

ALTER TABLE student
CHANGE age student_age INT;

ALTER TABLE student
DROP COLUMN student_age;

SELECT * FROM student;

ALTER TABLE student
RENAME TO stu;

SELECT * FROM stu;

ALTER TABLE stu
RENAME TO student;

TRUNCATE TABLE student;

-- Practice Qs --

ALTER TABLE student 
RENAME COLUMN name TO  full_name;

DELETE FROM student 
WHERE marks <80;

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;

-- --


CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student (id, name) VALUES (101, "karan"),(102, "arjun"),(103, "deepak"),(104, "shyam");

CREATE TABLE course (
    id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course (id, course) VALUES 
(101, "java"),(102, "c++"),(103, "python"),(104, "c"),(105, "sql"),(106, "php");

SELECT * FROM 
student AS s
INNER JOIN 
course AS c
ON s.id = c.id;

SELECT * FROM 
student AS s
LEFT JOIN 
course AS c
ON s.id = c.id;

SELECT * FROM 
student AS s
RIGHT JOIN 
course AS c
ON s.id = c.id;

SELECT * FROM 
student AS s
LEFT JOIN 
course AS c
ON s.id = c.id
UNION
SELECT * FROM 
student AS s
RIGHT JOIN 
course AS c
ON s.id = c.id;

SELECT * FROM 
student AS s
LEFT JOIN 
course AS c
ON s.id = c.id 
WHERE c.id IS NULL;

SELECT * FROM 
student AS s
RIGHT JOIN 
course AS c
ON s.id = c.id 
WHERE s.id IS NULL;

SELECT * FROM 
student AS s
LEFT JOIN 
course AS c
ON s.id = c.id
UNION
SELECT * FROM 
student AS s
RIGHT JOIN 
course AS c
ON s.id = c.id
WHERE s.id IS NOT NULL AND c.id IS NOT NULL;

CREATE TABLE employee( 
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee (id, name, manager_id) VALUES (101 , "adam" , 103),
(102 , "bob" , 104),
(103 , "casey" , NULL),
(104, "donald",103);

SELECT * FROM employee;

SELECT a.name as manager_name , b.name 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT name FROM employee
UNION
SELECT name FROM employee;

SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

SELECT * FROM student;

SELECT AVG(marks) FROM student;

SELECT name ,marks FROM student WHERE marks > 74.33;

SELECT name ,marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

SELECT name,rollno FROM student WHERE rollno IN (SELECT rollno  FROM student WHERE rollno % 2=0);

SELECT * FROM student WHERE city="Delhi";

SELECT MAX(marks) FROM (SELECT * FROM student WHERE city="Delhi") AS temp;

SELECT (SELECT MAX(marks) FROM student), name FROM student;


CREATE VIEW view1 AS 
SELECT rollno , name,marks FROM student;

SELECT * FROM view1;

SELECT * FROM view1 WHERE marks > 90;

DROP VIEW view1;

SELECT * FROM view1;

-- -- 