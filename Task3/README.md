# Simple Aggregation and Grouping
# Objective:
- Summarize data using aggregate functions and grouping.

# Requirements:
1. Write a query that uses aggregate functions such as COUNT() , SUM() , or
AVG() to calculate totals or averages.
2. Use the GROUP BY clause to aggregate data by a specific column (e.g.,
count the number of employees per department).
3. Optionally, filter grouped results using the HAVING clause.

# Query

1. Aggregate functiions:
```sql
SELECT COUNT(*) AS TotalStudents
FROM Students;
```
```sql
+---------------+
| TotalStudents |
+---------------+
|             5 |
+---------------+
1 row in set (0.01 sec)
```
```sql
SELECT SUM(Age) AS TotalAge
FROM Students;
```
```sql
+----------+
| TotalAge |
+----------+
|      107 |
+----------+
1 row in set (0.01 sec)
```
```sql
SELECT AVG(Grade) AS AverageGrade
FROM Students;
```
```sql
+-------------------+
| AverageGrade      |
+-------------------+
| 8.320000171661377 |
+-------------------+
1 row in set (0.01 sec)
```

2. Grouping:
```sql
SELECT Department, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Department;
```
```sql
+------------------------+------------------+
| Department             | NumberOfStudents |
+------------------------+------------------+
| Computer Science       |                1 |
| Mechanical             |                1 |
| Electronics            |                1 |
| Civil                  |                1 |
| Information Technology |                1 |
+------------------------+------------------+
5 rows in set (0.01 sec)
```
```sql
SELECT Section, AVG(Grade) AS AverageGrade
FROM Students
GROUP BY Section;
```
```sql
+---------+--------------------+
| Section | AverageGrade       |
+---------+--------------------+
| A       |  8.900000095367432 |
| B       | 7.8500001430511475 |
| C       |  8.100000381469727 |
+---------+--------------------+
3 rows in set (0.00 sec)
```
3. Using HAVING Clause
```sql
SELECT Department, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Department
HAVING COUNT(*) > 1;
```
```sql
+-------------+------------------+
| Department  | NumberOfStudents |
+-------------+------------------+
| Electronics |                2 |
+-------------+------------------+
1 row in set (0.01 sec)
```