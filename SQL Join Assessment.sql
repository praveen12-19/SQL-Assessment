USE mydatabase;

-- TABLE CREATION --
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT,
    Salary INT
);
-- INSERT VALUES --
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary)
VALUES
(1, 'Pravii', 101, 50000),
(2, 'Sasuke', 102, 65000),
(3, 'Naruto', 101, 55000),
(4, 'Luffy', 103, 70000),
(5, 'Pikachu', NULL, 45000),
(6, 'Zoro', 104, 60000);

SELECT * FROM Employees;
/*+-------+---------+--------+--------+
| EmpID | EmpName | DeptID | Salary |
+-------+---------+--------+--------+
|     1 | Pravii  |    101 |  50000 |
|     2 | Sasuke  |    102 |  65000 |
|     3 | Naruto  |    101 |  55000 |
|     4 | Luffy   |    103 |  70000 |
|     5 | Pikachu |   NULL |  45000 |
|     6 | Zoro    |    104 |  60000 |
+-------+---------+--------+--------+*/

-- TABLE CREATION --
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);
-- INSERT VALUE--
INSERT INTO Departments (DeptID, DeptName)
VALUES
(101, 'Development'),
(102, 'Testing'),
(103, 'HR'),
(105, 'Marketing');

SELECT * FROM Departments;
/*+--------+-------------+
| DeptID | DeptName    |
+--------+-------------+
|    101 | Development |
|    102 | Testing     |
|    103 | HR          |
|    105 | Marketing   |
+--------+-------------+*/

-- 1.INNER JOIN --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Naruto  | Development |  55000 |
| Luffy   | HR          |  70000 |
+---------+-------------+--------+*/

-- 2.LEFT JOIN --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Naruto  | Development |  55000 |
| Luffy   | HR          |  70000 |
| Pikachu | NULL        |  45000 |
| Zoro    | NULL        |  60000 |
+---------+-------------+--------+*/

-- 3.RIGHT JOIN--
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
RIGHT JOIN Departments d
ON e.DeptID = d.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Naruto  | Development |  55000 |
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Luffy   | HR          |  70000 |
| NULL    | Marketing   |   NULL |
+---------+-------------+--------+*/

-- 4.FULL JOIN --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID
UNION
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
RIGHT JOIN Departments d
ON e.DeptID = d.DeptID;

/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Naruto  | Development |  55000 |
| Luffy   | HR          |  70000 |
| Pikachu | NULL        |  45000 |
| Zoro    | NULL        |  60000 |
| NULL    | Marketing   |   NULL |
+---------+-------------+--------+*/

-- 5.LEFT ANTI JOIN--
SELECT e.*
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;
/*+-------+---------+--------+--------+
| EmpID | EmpName | DeptID | Salary |
+-------+---------+--------+--------+
|     5 | Pikachu |   NULL |  45000 |
|     6 | Zoro    |    104 |  60000 |
+-------+---------+--------+--------+*/

-- 6.RIGHT JOIN --
SELECT d.*
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID
WHERE e.EmpID IS NULL;
/*
+--------+-----------+
| DeptID | DeptName  |
+--------+-----------+
|    105 | Marketing |
+--------+-----------+
*/

-- 7.INNER JOIN ALTERNATIVE METHOD --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e,
     Departments d
WHERE e.DeptID = d.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Naruto  | Development |  55000 |
| Luffy   | HR          |  70000 |
+---------+-------------+--------+*/

-- 8.LEFT JOIN TO RIGHT JOIN --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Departments d
RIGHT JOIN Employees e
ON d.DeptID = e.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Naruto  | Development |  55000 |
| Luffy   | HR          |  70000 |
| Pikachu | NULL        |  45000 |
| Zoro    | NULL        |  60000 |
+---------+-------------+--------+*/

-- 8.RIGHT JOIN TO LEFT JOIN --
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID;
/*+---------+-------------+--------+
| EmpName | DeptName    | Salary |
+---------+-------------+--------+
| Naruto  | Development |  55000 |
| Pravii  | Development |  50000 |
| Sasuke  | Testing     |  65000 |
| Luffy   | HR          |  70000 |
| NULL    | Marketing   |   NULL |
+---------+-------------+--------+*/

-- 9.CROSS JOIN --
SELECT e.EmpName,
       d.DeptName
FROM Employees e
CROSS JOIN Departments d;
/*+---------+-------------+
| EmpName | DeptName    |
+---------+-------------+
| Pravii  | Marketing   |
| Pravii  | HR          |
| Pravii  | Testing     |
| Pravii  | Development |
| Sasuke  | Marketing   |
| Sasuke  | HR          |
| Sasuke  | Testing     |
| Sasuke  | Development |
| Naruto  | Marketing   |
| Naruto  | HR          |
| Naruto  | Testing     |
| Naruto  | Development |
| Luffy   | Marketing   |
| Luffy   | HR          |
| Luffy   | Testing     |
| Luffy   | Development |
| Pikachu | Marketing   |
| Pikachu | HR          |
| Pikachu | Testing     |
| Pikachu | Development |
| Zoro    | Marketing   |
| Zoro    | HR          |
| Zoro    | Testing     |
| Zoro    | Development |
+---------+-------------+*/

-- 10. SELF JOIN - ADDING NEW COLUMN TO THE TABLE AND UPDATING ITS VALUES --
ALTER TABLE Employees
ADD ManagerID INT;

UPDATE Employees
SET ManagerID = NULL
WHERE EmpID = 1;

UPDATE Employees
SET ManagerID = 1
WHERE EmpID = 2;

UPDATE Employees
SET ManagerID = 1
WHERE EmpID = 3;

UPDATE Employees
SET ManagerID = 2
WHERE EmpID = 4;

UPDATE Employees
SET ManagerID = 2
WHERE EmpID = 5;

UPDATE Employees
SET ManagerID = 3
WHERE EmpID = 6;


SELECT
e.EmpName AS Employee,
m.EmpName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmpID;
/*+----------+---------+
| Employee | Manager |
+----------+---------+
| Pravii   | NULL    |
| Sasuke   | Pravii  |
| Naruto   | Pravii  |
| Luffy    | Sasuke  |
| Pikachu  | Sasuke  |
| Zoro     | Naruto  |
+----------+---------+*/
