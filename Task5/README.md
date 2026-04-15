# Subqueries and Nested Queries
# Objective:
Use subqueries to filter or compute values within a main query.
# Requirements:
1. Write a query that uses a subquery in the WHERE clause (e.g., select
employees whose salary is above the department’s average salary).
2. Alternatively, use subqueries in the SELECT list to compute dynamic
columns.
3. Understand the difference between correlated and non-correlated
subqueries.

# Query:
1. Subquery in WHERE clause:
```sql
SELECT Name, Grade
FROM Students
WHERE Grade > (
    SELECT AVG(Grade)
    FROM Students
);
```
```sql
+---------+-------+
| Name    | Grade |
+---------+-------+
| Vignesh |   8.6 |
| Maha    |   9.2 |
| Vicky   |   9.2 |
+---------+-------+
3 rows in set (0.01 sec)
```
2. Subquery Using Department Average
```sql
SELECT Name, Department, Grade
FROM Students S1
WHERE Grade > (
    SELECT AVG(Grade)
    FROM Students S2
    WHERE S1.Department = S2.Department
);
```
```sql
+------+------------------+-------+
| Name | Department       | Grade |
+------+------------------+-------+
| Vigi | Computer Science |     9 |
+------+------------------+-------+
1 row in set (0.01 sec)
```
3. Subquery in SELECT list:
```sql
SELECT Name, Grade,
    (SELECT AVG(Grade) FROM Students) AS AverageGrade
FROM Students;
```
```sql
+---------+-------+-------------------+
| Name    | Grade | AverageGrade      |
+---------+-------+-------------------+
| Vignesh |   8.6 | 8.542857238224574 |
| Vijay   |   7.8 | 8.542857238224574 |
| Maha    |   9.2 | 8.542857238224574 |
| Shriram |   8.1 | 8.542857238224574 |
| Ajith   |   7.9 | 8.542857238224574 |
| Vicky   |   9.2 | 8.542857238224574 |
| Vigi    |     9 | 8.542857238224574 |
+---------+-------+-------------------+
7 rows in set (0.00 sec)
```
4. Subquery in FROM clause:
```sql
SELECT *
FROM (
    SELECT AVG(Grade) AS AvgGrade
    FROM Students
) AS TempTable,
Students
WHERE Students.Grade > TempTable.AvgGrade;
```
```sql
+-------------------+-----------+---------+------------------+------+-------+---------+-------------------+
| AvgGrade          | StudentID | Name    | Department       | Age  | Grade | Section | Email             |
+-------------------+-----------+---------+------------------+------+-------+---------+-------------------+
| 8.542857238224574 |         1 | Vignesh | Computer Science |   21 |   8.6 | A       | vignesh@gmail.com |
| 8.542857238224574 |         3 | Maha    | Electronics      |   20 |   9.2 | A       | maha@gmail.com    |
| 8.542857238224574 |         6 | Vicky   | Electronics      |   20 |   9.2 | A       | vicky@gmail.com   |
| 8.542857238224574 |         8 | Vigi    | Computer Science |   21 |     9 | A       | vigi@gmail.com    |
+-------------------+-----------+---------+------------------+------+-------+---------+-------------------+
4 rows in set (0.00 sec)
```