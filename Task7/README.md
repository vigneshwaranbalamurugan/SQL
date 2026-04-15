# Window Functions and Ranking
# Objective:
Leverage window functions to perform calculations across a set of
rows.

# Requirements:
- Write a query using window functions such as ROW_NUMBER() , RANK() , or
DENSE_RANK() to assign ranks (e.g., rank employees by salary within
each department).
- Use PARTITION BY to define groups and ORDER BY to specify the ranking
order.
- Experiment with other window functions like LEAD() or LAG() to access
adjacent row values.

# Query:

1. Row_Number:
```sql
SELECT Name, Department, Grade,
ROW_NUMBER() OVER(
PARTITION BY Department
ORDER BY Grade DESC
) AS RowNumber
FROM Students;
```
```sql
+---------+------------+-------+-----------+
| Name    | Department | Grade | RowNumber |
+---------+------------+-------+-----------+
| Vignesh | CSE        |   8.5 |         1 |
| Ajith   | CSE        |   8.5 |         2 |
| Vijay   | CSE        |   7.2 |         3 |
| Maha    | ECE        |   9.1 |         1 |
| Shriram | ECE        |   8.8 |         2 |
+---------+------------+-------+-----------+
5 rows in set (0.01 sec)
```
2. RANK:
```sql
SELECT Name, Department, Grade,
RANK() OVER(
PARTITION BY Department
ORDER BY Grade DESC
) AS RankPosition
FROM Students;
```
```sql
+---------+------------+-------+--------------+
| Name    | Department | Grade | RankPosition |
+---------+------------+-------+--------------+
| Vignesh | CSE        |   8.5 |            1 |
| Ajith   | CSE        |   8.5 |            1 |
| Vijay   | CSE        |   7.2 |            3 |
| Maha    | ECE        |   9.1 |            1 |
| Shriram | ECE        |   8.8 |            2 |
+---------+------------+-------+--------------+
5 rows in set (0.00 sec)
```
3. Dense_Rank:
```sql
SELECT Name, Department, Grade,
DENSE_RANK() OVER(
PARTITION BY Department
ORDER BY Grade DESC
) AS DenseRankPosition
FROM Students;
```
```sql
+---------+------------+-------+-------------------+
| Name    | Department | Grade | DenseRankPosition |
+---------+------------+-------+-------------------+
| Vignesh | CSE        |   8.5 |                 1 |
| Ajith   | CSE        |   8.5 |                 1 |
| Vijay   | CSE        |   7.2 |                 2 |
| Maha    | ECE        |   9.1 |                 1 |
| Shriram | ECE        |   8.8 |                 2 |
+---------+------------+-------+-------------------+
5 rows in set (0.00 sec)
```

4. LEAD
```sql
SELECT Name, Department, Grade,
LEAD(Grade) OVER(
PARTITION BY Department
ORDER BY Grade DESC
) AS NextStudentGrade
FROM Students;
```
```sql
+---------+------------+-------+------------------+
| Name    | Department | Grade | NextStudentGrade |
+---------+------------+-------+------------------+
| Vignesh | CSE        |   8.5 |              8.5 |
| Ajith   | CSE        |   8.5 |              7.2 |
| Vijay   | CSE        |   7.2 |             NULL |
| Maha    | ECE        |   9.1 |              8.8 |
| Shriram | ECE        |   8.8 |             NULL |
+---------+------------+-------+------------------+
5 rows in set (0.01 sec)
```

5. LAG
```sql
SELECT Name, Department, Grade,
LAG(Grade) OVER(
PARTITION BY Department
ORDER BY Grade DESC
) AS PreviousStudentGrade
FROM Students;
```
```sql
+---------+------------+-------+----------------------+
| Name    | Department | Grade | PreviousStudentGrade |
+---------+------------+-------+----------------------+
| Vignesh | CSE        |   8.5 |                 NULL |
| Ajith   | CSE        |   8.5 |                  8.5 |
| Vijay   | CSE        |   7.2 |                  8.5 |
| Maha    | ECE        |   9.1 |                 NULL |
| Shriram | ECE        |   8.8 |                  9.1 |
+---------+------------+-------+----------------------+
5 rows in set (0.00 sec)
```