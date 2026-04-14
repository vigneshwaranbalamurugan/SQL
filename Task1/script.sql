CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Age INT,
    Grade FLOAT,
    Section CHAR(1),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Students (StudentID, Name, Department, Age, Grade, Section, Email) VALUES
(1, 'Vignesh', 'Computer Science', 21, 8.6, 'A', 'vignesh@gmail.com'),
(2, 'Vijay', 'Mechanical', 22, 7.8, 'B', 'vijay@gmail.com'),
(3, 'Maha', 'Electronics', 20, 9.2, 'A', 'maha@gmail.com'),
(4, 'Shriram', 'Civil', 23, 8.1, 'C', 'shriram@gmail.com'),
(5, 'Ajith', 'Information Technology', 21, 7.9, 'B', 'ajith@gmail.com');

SELECT * FROM Students;
