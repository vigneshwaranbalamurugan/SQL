# Multi-Table JOINs
# Objective:
- Combine data from two related tables using JOIN operations.
# Requirements:
- Create two related tables (e.g., Customers and Orders ) with a foreign key
relationship.
- Write an INNER JOIN query to retrieve combined information (e.g.,
customer names along with their order details).
- Experiment with other types of joins such as LEFT JOIN to understand
how missing matches are handled.

# Query:
1. Create the Customers and Orders tables:
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(100)
);
```

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Amount FLOAT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```
2. Insert Data
```sql
INSERT INTO Customers VALUES
(1, 'Vignesh', 'Chennai', 'vignesh@gmail.com'),
(2, 'Vijay', 'Madurai', 'vijay@gmail.com'),
(3, 'Maha', 'Coimbatore', 'maha@gmail.com'),
(4, 'Shriram', 'Salem', 'shriram@gmail.com'),
(5, 'Ajith', 'Trichy', 'ajith@gmail.com');
```

```sql
INSERT INTO Orders VALUES
(101, 'Laptop', 65000, 1),
(102, 'Mobile', 25000, 2),
(103, 'Headphones', 3000, 1),
(104, 'Keyboard', 1500, 3);
```
3. INNER JOIN Query
```sql
SELECT Customers.CustomerName, Orders.ProductName, Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```
```sql
+--------------+-------------+--------+
| CustomerName | ProductName | Amount |
+--------------+-------------+--------+
| Vignesh      | Laptop      |  65000 |
| Vijay        | Mobile      |  25000 |
| Vignesh      | Headphones  |   3000 |
| Maha         | Keyboard    |   1500 |
+--------------+-------------+--------+
4 rows in set (0.01 sec)
```
4. LEFT JOIN Query
```sql
SELECT Customers.CustomerName, Orders.ProductName, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```
```sql
+--------------+-------------+--------+
| CustomerName | ProductName | Amount |
+--------------+-------------+--------+
| Vignesh      | Laptop      |  65000 |
| Vignesh      | Headphones  |   3000 |
| Vijay        | Mobile      |  25000 |
| Maha         | Keyboard    |   1500 |
| Shriram      | NULL        |   NULL |
| Ajith        | NULL        |   NULL |
+--------------+-------------+--------+
6 rows in set (0.01 sec)
```