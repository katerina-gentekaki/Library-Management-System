CREATE DATABASE Books;
USE Books;
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE BorrowedBooks (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);


INSERT INTO Authors VALUES
(1, 'George Orwell', 'UK'),
(2, 'Jane Austen', 'UK'),
(3, 'Mark Twain', 'USA'),
(4, 'J.K. Rowling', 'UK'),
(5, 'Ernest Hemingway', 'USA');

INSERT INTO Books VALUES
(1, '1984', 1, 1949),
(2, 'Pride and Prejudice', 2, 1813),
(3, 'Adventures of Huckleberry Finn', 3, 1884),
(4, 'Animal Farm', 1, 1945),
(5, 'Emma', 2, 1815),
(6, 'The Adventures of Tom Sawyer', 3, 1876),
(7, 'Sense and Sensibility', 2, 1811),
(8, 'Roughing It', 3, 1872),
(9, 'Homage to Catalonia', 1, 1938),
(10, 'Harry Potter and the Sorcerer\'s Stone', 4, 1997),
(11, 'Harry Potter and the Chamber of Secrets', 4, 1998),
(12, 'The Old Man and the Sea', 5, 1952),
(13, 'A Farewell to Arms', 5, 1929),
(14, 'Harry Potter and the Prisoner of Azkaban', 4, 1999),
(15, 'Down and Out in Paris and London', 1, 1933),
(16, 'Northanger Abbey', 2, 1817),
(17, 'Life on the Mississippi', 3, 1883);

INSERT INTO Borrowers VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Rose', 'charlie@example.com'),
(4, 'Diana Prince', 'diana@example.com'),
(5, 'Ethan Hunt', 'ethan@example.com');

INSERT INTO BorrowedBooks VALUES
(1, 1, 1, '2025-06-01', NULL),
(2, 2, 2, '2025-06-05', '2025-06-10'),
(3, 4, 3, '2025-06-07', '2025-06-14'),  
(4, 5, 2, '2025-06-08', NULL),         
(5, 6, 4, '2025-06-10', '2025-06-15'), 
(6, 7, 1, '2025-06-12', NULL),        
(7, 8, 5, '2025-06-13', NULL),         
(8, 9, 3, '2025-06-14', NULL);

-- Q.1 Show the 5 most recently published books --

SELECT title, published_year
FROM Books
ORDER BY published_year DESC
LIMIT 5;

-- Q.2 List all authors and their books --

SELECT a.name AS Author, b.title AS Book
FROM Authors a
JOIN Books b ON a.author_id = b.author_id;

-- Q.3 Count how many books each author has written --

SELECT a.name AS author, COUNT(*) AS total_books
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
GROUP BY a.author_id;

-- Q.4 List all borrowers who have borrowed books --

SELECT DISTINCT br.name
FROM BorrowedBooks bb
JOIN Borrowers br ON bb.borrower_id = br.borrower_id;

-- Q.5 Books borrowed by Alice --

SELECT b.title
FROM Books b
JOIN BorrowedBooks bb ON b.book_id = bb.book_id
JOIN Borrowers br ON bb.borrower_id = br.borrower_id
WHERE br.name = 'Alice Johnson';

-- Q.6 Find books currently borrowed (not returned yet) --

SELECT b.title, br.name AS borrower, bb.borrow_date
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.book_id
JOIN Borrowers br ON bb.borrower_id = br.borrower_id
WHERE bb.return_date IS NULL;

-- Q.7 Find borrowers who have borrowed more than 1 book --

SELECT name
FROM Borrowers
WHERE borrower_id IN (
    SELECT borrower_id
    FROM BorrowedBooks
    GROUP BY borrower_id
    HAVING COUNT(*) > 1
);


