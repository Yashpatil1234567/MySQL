-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Tables
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    available_copies INT
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50),
    join_date DATE
);

CREATE TABLE Borrow (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert Sample Data
INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 3),
(2, 'Atomic Habits', 'James Clear', 5),
(3, 'Wings of Fire', 'A. P. J. Abdul Kalam', 2);

INSERT INTO Members VALUES
(101, 'Yash', '2023-06-01'),
(102, 'Priya', '2023-08-15');

INSERT INTO Borrow VALUES
(1, 101, 1, '2023-09-01', '2023-09-10'),
(2, 102, 2, '2023-09-05', NULL);

-- Query 1: List all borrowed books with member name
SELECT m.member_name, b.title, br.borrow_date, br.return_date
FROM Borrow br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id;

-- Query 2: Find members who have not returned books
SELECT m.member_name, b.title
FROM Borrow br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;

-- Query 3: Show total available copies of each book
SELECT title, available_copies
FROM Books;
