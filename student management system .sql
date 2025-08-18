-- Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Create Table
CREATE TABLE Students (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Dept VARCHAR(30),
    Marks INT
);

-- Insert Records
INSERT INTO Students VALUES
(1, 'Yash', 19, 'AIML', 85),
(2, 'Priya', 20, 'CSE', 92),
(3, 'Rohan', 21, 'IT', 76),
(4, 'Sneha', 19, 'AIML', 88),
(5, 'Amit', 22, 'CSE', 67);

-- Display All Records
SELECT * FROM Students;

-- Find Students with Marks > 80
SELECT Name, Dept, Marks
FROM Students
WHERE Marks > 80;

-- Update Marks of a Student
UPDATE Students
SET Marks = 90
WHERE RollNo = 3;

-- Delete a Student Record
DELETE FROM Students
WHERE RollNo = 5;

-- Count Students in Each Department
SELECT Dept, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Dept;

-- Find the Student with Highest Marks
SELECT Name, Marks
FROM Students
WHERE Marks = (SELECT MAX(Marks) FROM Students);

-- Sort Students by Marks (High to Low)
SELECT * FROM Students ORDER BY Marks DESC;
