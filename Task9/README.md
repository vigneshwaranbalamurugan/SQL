# Stored Procedures and User-Defined Functions
# Objective:
Encapsulate business logic using stored procedures and functions.
# Requirements:
1. Create a stored procedure that accepts parameters (e.g., a date range)
and returns a result set (such as total sales within that range).
2. Write a scalar or table-valued user-defined function that performs a
calculation (e.g., calculates a discount or bonus based on input
parameters).
3. Test the procedure and function by calling them and verifying their
outputs.

# Query:
1. User Defined Function:
```sql
DELIMITER //

CREATE FUNCTION CalculateDiscount(amount FLOAT)
RETURNS FLOAT

BEGIN
    DECLARE discount FLOAT;

    IF amount > 50000 THEN
        SET discount = amount * 0.10;
    ELSEIF amount > 20000 THEN
        SET discount = amount * 0.05;
    ELSE
        SET discount = amount * 0.02;
    END IF;

    RETURN discount;
END //

DELIMITER ;
```
```sql
SELECT
CustomerName,
Amount,
CalculateDiscount(Amount) AS Discount
FROM Orders;

+--------------+--------+----------+
| CustomerName | Amount | Discount |
+--------------+--------+----------+
| Vignesh      |  65000 |     6500 |
| Vijay        |  25000 |     1250 |
| Maha         |   3000 |       60 |
| Shriram      |   1500 |       30 |
| Ajith        |    800 |       16 |
+--------------+--------+----------+
5 rows in set (0.00 sec)
```

2. Stored Procedure:
```sql
DELIMITER //

CREATE PROCEDURE GetTotalSales(
    IN StartDate DATE,
    IN EndDate DATE
)
BEGIN
    SELECT SUM(Amount) AS TotalSales
    FROM Orders
    WHERE OrderDate BETWEEN StartDate AND EndDate;
END //

DELIMITER ;
```
```sql
CALL GetTotalSales('2024-01-01', '2024-12-31');
+------------+
| TotalSales |
+------------+
|      93000 |
+------------+
1 row in set (0.01 sec)
```