# Date and Time Functions
# Objective:
Manipulate and query data based on date and time values.

# Requirements:
- Use built-in date functions (e.g., DATEDIFF , DATEADD , or your SQL
dialect’s equivalent) to calculate intervals or adjust dates.
- Write a query to filter records based on date ranges (e.g., orders
placed within the last 30 days).
- Format date outputs if necessary using functions like CONVERT or
TO_CHAR .

# Query:

1. DATEDIFF:
```sql
SELECT OrderID, ProductName,
DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM Orders;
```
```sql
+---------+-------------+----------------+
| OrderID | ProductName | DaysSinceOrder |
+---------+-------------+----------------+
|     101 | Laptop      |             36 |
|     102 | Mobile      |             21 |
|     103 | Headphones  |             10 |
|     104 | Keyboard    |              3 |
|     105 | Mouse       |             54 |
+---------+-------------+----------------+
5 rows in set (0.01 sec)
```
```sql
SELECT OrderID, ProductName,
DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM Orders;
```
```sql
+---------+-------------+----------------+
| OrderID | ProductName | DaysSinceOrder |
+---------+-------------+----------------+
|     101 | Laptop      |             36 |
|     102 | Mobile      |             21 |
|     103 | Headphones  |             10 |
|     104 | Keyboard    |              3 |
|     105 | Mouse       |             54 |
+---------+-------------+----------------+
5 rows in set (0.00 sec)
```

2. DATEADD:
```sql
SELECT OrderID, ProductName,
DATE_ADD(OrderDate, INTERVAL 7 DAY) AS ExpectedDeliveryDate
FROM Orders;
```
```sql
+---------+-------------+----------------------+
| OrderID | ProductName | ExpectedDeliveryDate |
+---------+-------------+----------------------+
|     101 | Laptop      | 2026-03-17           |
|     102 | Mobile      | 2026-04-01           |
|     103 | Headphones  | 2026-04-12           |
|     104 | Keyboard    | 2026-04-19           |
|     105 | Mouse       | 2026-02-27           |
+---------+-------------+----------------------+
5 rows in set (0.00 sec)
```
3. Filter Orders in Last 30 Days:
```sql
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```
```sql
+---------+--------------+-------------+--------+------------+
| OrderID | CustomerName | ProductName | Amount | OrderDate  |
+---------+--------------+-------------+--------+------------+
|     102 | Vijay        | Mobile      |  25000 | 2026-03-25 |
|     103 | Maha         | Headphones  |   3000 | 2026-04-05 |
|     104 | Shriram      | Keyboard    |   1500 | 2026-04-12 |
+---------+--------------+-------------+--------+------------+
3 rows in set (0.01 sec)
```
4. Filter between two dates:
```sql
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2026-03-01' AND '2026-04-10';
```
```sql
+---------+--------------+-------------+--------+------------+
| OrderID | CustomerName | ProductName | Amount | OrderDate  |
+---------+--------------+-------------+--------+------------+
|     101 | Vignesh      | Laptop      |  65000 | 2026-03-10 |
|     102 | Vijay        | Mobile      |  25000 | 2026-03-25 |
|     103 | Maha         | Headphones  |   3000 | 2026-04-05 |
+---------+--------------+-------------+--------+------------+
3 rows in set (0.00 sec)
```
5. Format Date Output:
```sql
SELECT OrderID,
DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedDate
FROM Orders;
```
```sql
+---------+---------------+
| OrderID | FormattedDate |
+---------+---------------+
|     101 | 10-03-2026    |
|     102 | 25-03-2026    |
|     103 | 05-04-2026    |
|     104 | 12-04-2026    |
|     105 | 20-02-2026    |
+---------+---------------+
5 rows in set (0.01 sec)
```