# Common Table Expressions (CTEs) and Recursive Queries
# Objective:
Simplify complex queries and process hierarchical data using CTEs.
# Requirements:
1. Write a non-recursive CTE to structure a multi-step query for
readability (e.g., breaking down a complex aggregation).
2. Create a recursive CTE to display hierarchical data (e.g., an
organizational chart or a category tree).

# Query
1. Non-Recursive CTE:
```sql
WITH DeptAvg AS (
    SELECT Department,
           AVG(Grade) AS AvgGrade
    FROM Students
    GROUP BY Department
)

SELECT S.Name, S.Department, S.Grade
FROM Students S
JOIN DeptAvg D
ON S.Department = D.Department
WHERE S.Grade > D.AvgGrade;
```
```sql
+---------+------------+-------+
| Name    | Department | Grade |
+---------+------------+-------+
| Vignesh | CSE        |   8.5 |
| Maha    | ECE        |   9.1 |
| Ajith   | CSE        |   8.5 |
+---------+------------+-------+
3 rows in set (0.01 sec)

```
2. Recursive CTE:
```sql
WITH RECURSIVE MentorLevel AS (
    SELECT
        StudentID,
        StudentName,
        MentorID,
        1 AS Level
    FROM Mentors
    WHERE MentorID IS NULL

    UNION ALL

    SELECT
        S.StudentID,
        S.StudentName,
        S.MentorID,
        ST.Level + 1
    FROM Mentors S
    JOIN MentorLevel ST
    ON S.MentorID = ST.StudentID
)

SELECT * FROM MentorLevel;
```
```sql
+-----------+---------------+----------+-------+
| StudentID | StudentName   | MentorID | Level |
+-----------+---------------+----------+-------+
|         1 | FacultyMentor |     NULL |     1 |
|         2 | Vignesh       |        1 |     2 |
|         3 | Vijay         |        1 |     2 |
|         4 | Maha          |        2 |     3 |
|         5 | Shriram       |        2 |     3 |
|         6 | Ajith         |        3 |     3 |
+-----------+---------------+----------+-------+
6 rows in set (0.00 sec)
```
