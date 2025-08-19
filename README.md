 

# 📘 SQL Notes

A complete reference for **SQL Datatypes, Commands, Constraints, Queries, Joins, and Advanced Concepts**.
This document is designed for quick revision and practice. 🚀

---

## 🗂️ SQL Data Types

| Data Type      | Description                  | Example       |
| -------------- | ---------------------------- | ------------- |
| **CHAR(n)**    | Fixed-length string          | `CHAR(50)`    |
| **VARCHAR(n)** | Variable-length string       | `VARCHAR(50)` |
| **BLOB(n)**    | Binary Large Object          | `BLOB(1000)`  |
| **INT**        | Integer                      | `INT`         |
| **TINYINT**    | -128 to 127                  | `TINYINT`     |
| **BIGINT**     | Very large integer           | `BIGINT`      |
| **BIT(n)**     | Stores bit values (1–64)     | `BIT(2)`      |
| **FLOAT**      | Decimal (up to 23 precision) | `FLOAT`       |
| **DOUBLE**     | Decimal (24–53 precision)    | `DOUBLE`      |
| **BOOLEAN**    | `0` or `1`                   | `BOOLEAN`     |
| **DATE**       | `YYYY-MM-DD`                 | `DATE`        |
| **YEAR**       | Year (4 digits)              | `YEAR`        |

**Signed & Unsigned:**

* `TINYINT SIGNED` → (-128 to 127)
* `TINYINT UNSIGNED` → (0 to 255)

---

## ⚡ Types of SQL Commands

| Type    | Full Form                    | Examples                              |
| ------- | ---------------------------- | ------------------------------------- |
| **DDL** | Data Definition Language     | `CREATE`, `ALTER`, `TRUNCATE`, `DROP` |
| **DQL** | Data Query Language          | `SELECT`                              |
| **DML** | Data Manipulation Language   | `INSERT`, `UPDATE`, `DELETE`          |
| **DCL** | Data Control Language        | `GRANT`, `REVOKE`                     |
| **TCL** | Transaction Control Language | `COMMIT`, `ROLLBACK`, `SAVEPOINT`     |

---

## 🛢️ Database Queries

```sql
CREATE DATABASE db_name;
CREATE DATABASE IF NOT EXISTS db_name;

DROP DATABASE db_name;
DROP DATABASE IF EXISTS db_name;

SHOW DATABASES;
SHOW TABLES;
```

---

## 📋 Table Queries

### Create Table

```sql
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);
```

### Insert Data

```sql
INSERT INTO student (rollno, name) VALUES (101, "Karan"), (102, "Arjun");
INSERT INTO student VALUES (104, "Shyam");
```

### Select Data

```sql
SELECT * FROM student;
SELECT DISTINCT city FROM student;
```

---

## 🔑 Keys & Constraints

* **PRIMARY KEY** → Unique + Not Null (only 1 PK per table)
* **FOREIGN KEY** → Refers to primary key in another table (can be duplicate/null)
* **NOT NULL** → Disallows `NULL` values
* **UNIQUE** → All values must be unique
* **DEFAULT** → Sets default value
* **CHECK** → Restricts values

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    amount INT CHECK(amount > 0),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id)
);
```

---

## 🔍 SELECT in Detail

### WHERE Clause with Operators

* Arithmetic: `+`, `-`, `*`, `/`, `%`
* Comparison: `=`, `!=`, `>`, `<`, `>=`, `<=`
* Logical: `AND`, `OR`, `NOT`, `IN`, `BETWEEN`, `LIKE`

```sql
SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";
SELECT * FROM student WHERE city IN ("Delhi", "Mumbai");
SELECT * FROM student WHERE marks BETWEEN 70 AND 90;
```

### Sorting & Limiting

```sql
SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student LIMIT 5;
```

---

## 📊 Aggregate Functions

```sql
SELECT COUNT(*) FROM student;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT city, COUNT(name) FROM student GROUP BY city;
```

### HAVING (with GROUP BY)

```sql
SELECT city, COUNT(name)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;
```

---

## ✏️ Update & Delete

```sql
UPDATE student SET grade = "O" WHERE grade = "A";
DELETE FROM student WHERE marks < 33;
DELETE FROM student; -- deletes all rows
```

---

## 🔗 Joins in SQL

| Join Type      | Description                              |
| -------------- | ---------------------------------------- |
| **INNER JOIN** | Returns only matching rows               |
| **LEFT JOIN**  | All rows from left + matching from right |
| **RIGHT JOIN** | All rows from right + matching from left |
| **FULL JOIN**  | All rows from both tables                |

```sql
-- INNER JOIN
SELECT * FROM student 
INNER JOIN course ON student.student_id = course.student_id;

-- LEFT JOIN
SELECT * FROM student 
LEFT JOIN course ON student.student_id = course.student_id;

-- FULL JOIN using UNION
SELECT * FROM student LEFT JOIN course ON student.student_id = course.student_id
UNION
SELECT * FROM student RIGHT JOIN course ON student.student_id = course.student_id;
```

---

## 🔄 Advanced SQL

### Self Join

```sql
SELECT a.name, b.name
FROM student a
JOIN student b ON a.city = b.city;
```

### UNION

```sql
SELECT name FROM student
UNION
SELECT name FROM alumni;
```

### Subqueries

```sql
SELECT name, marks 
FROM student 
WHERE marks > (SELECT AVG(marks) FROM student);
```

---

## 👁️ Views in SQL

```sql
CREATE VIEW top_students AS
SELECT rollno, name, marks FROM student WHERE marks > 90;

SELECT * FROM top_students;
```

---

## 📌 Quick Order of Query Execution

```sql
SELECT columns
FROM table_name
WHERE condition
GROUP BY columns
HAVING condition
ORDER BY columns ASC|DESC
LIMIT number;
```

--- 
## 🎯 Goals

* ✅ Understand SQL **datatypes** and their use cases
* ✅ Learn different types of **SQL commands (DDL, DML, DQL, DCL, TCL)**
* ✅ Practice **database & table creation** with constraints
* ✅ Master **SELECT queries** with filtering, sorting, grouping, and aggregation
* ✅ Work with **keys** (Primary, Foreign) and **constraints** (NOT NULL, UNIQUE, CHECK, DEFAULT)
* ✅ Learn **UPDATE**, **DELETE**, and **ALTER** operations
* ✅ Explore different **JOINs** and their use cases
* ✅ Understand **subqueries, unions, and views** for advanced SQL usage
* ✅ Revise SQL concepts with a **clear query execution order**

---

