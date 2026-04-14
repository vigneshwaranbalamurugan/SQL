# Basic Filtering and Sorting
# Objective:
- Write queries that filter records and sort the result set.
# Requirements:
- Use the WHERE clause to filter records based on a condition (e.g., WHERE
Department = 'Sales' ).
- Apply the ORDER BY clause to sort the results (e.g., by LastName or
Salary ).
- Experiment with multiple conditions using AND / OR .

---
1. Filtering using WHERE clause
```sql
SELECT * FROM Students WHERE Department = 'Computer Science';
```
Output:
```sql
+-----------+---------+------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department       | Age  | Grade | Section | Email             |
+-----------+---------+------------------+------+-------+---------+-------------------+
|         1 | Vignesh | Computer Science |   21 |   8.6 | A       | vignesh@gmail.com |
+-----------+---------+------------------+------+-------+---------+-------------------+
1 row in set (0.01 sec)
```
```sql
SELECT * FROM Students
WHERE Grade > 8.0;
```
Output:
```sql
+-----------+---------+------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department       | Age  | Grade | Section | Email             |
+-----------+---------+------------------+------+-------+---------+-------------------+
|         1 | Vignesh | Computer Science |   21 |   8.6 | A       | vignesh@gmail.com |
|         3 | Maha    | Electronics      |   20 |   9.2 | A       | maha@gmail.com    |
|         4 | Shriram | Civil            |   23 |   8.1 | C       | shriram@gmail.com |
+-----------+---------+------------------+------+-------+---------+-------------------+
3 rows in set (0.01 sec)

```
```sql
SELECT * FROM Students
WHERE Section = 'A';
```
Output:
```sql
+-----------+---------+------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department       | Age  | Grade | Section | Email             |
+-----------+---------+------------------+------+-------+---------+-------------------+
|         1 | Vignesh | Computer Science |   21 |   8.6 | A       | vignesh@gmail.com |
|         3 | Maha    | Electronics      |   20 |   9.2 | A       | maha@gmail.com    |
+-----------+---------+------------------+------+-------+---------+-------------------+
2 rows in set (0.00 sec)
```
2. Sorting using ORDER BY
```sql
SELECT * FROM Students
ORDER BY Name ASC;
```
Output:
```sql
+-----------+---------+------------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department             | Age  | Grade | Section | Email             |
+-----------+---------+------------------------+------+-------+---------+-------------------+
|         5 | Ajith   | Information Technology |   21 |   7.9 | B       | ajith@gmail.com   |
|         3 | Maha    | Electronics            |   20 |   9.2 | A       | maha@gmail.com    |
|         4 | Shriram | Civil                  |   23 |   8.1 | C       | shriram@gmail.com |
|         1 | Vignesh | Computer Science       |   21 |   8.6 | A       | vignesh@gmail.com |
|         2 | Vijay   | Mechanical             |   22 |   7.8 | B       | vijay@gmail.com   |
+-----------+---------+------------------------+------+-------+---------+-------------------+
5 rows in set (0.01 sec)
```
3. Multiple Conditions using AND
```sql
SELECT * FROM Students
WHERE Department = 'Computer Science'
AND Grade > 8;
```
Output:
```sql
+-----------+---------+------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department       | Age  | Grade | Section | Email             |
+-----------+---------+------------------+------+-------+---------+-------------------+
|         1 | Vignesh | Computer Science |   21 |   8.6 | A       | vignesh@gmail.com |
+-----------+---------+------------------+------+-------+---------+-------------------+
1 row in set (0.01 sec)
```
4. Multiple Conditions using OR
```sql
SELECT * FROM Students
WHERE Section = 'A'
OR Section = 'B';
```
Output:
```sql
+-----------+---------+------------------------+------+-------+---------+-------------------+
| StudentID | Name    | Department             | Age  | Grade | Section | Email             |
+-----------+---------+------------------------+------+-------+---------+-------------------+
|         1 | Vignesh | Computer Science       |   21 |   8.6 | A       | vignesh@gmail.com |
|         2 | Vijay   | Mechanical             |   22 |   7.8 | B       | vijay@gmail.com   |
|         3 | Maha    | Electronics            |   20 |   9.2 | A       | maha@gmail.com    |
|         5 | Ajith   | Information Technology |   21 |   7.9 | B       | ajith@gmail.com   |
+-----------+---------+------------------------+------+-------+---------+-------------------+
4 rows in set (0.00 sec)
```