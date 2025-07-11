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

-- Q.8 Find borrowers with books due in 2 Days and borrowers with overdue books --

SELECT 
    b.borrow_id,
    br.name AS borrower_name,
    br.email,
    bk.title AS book_title,
    b.return_date
FROM 
    BorrowedBooks b
JOIN 
    Borrowers br ON b.borrower_id = br.borrower_id
JOIN 
    Books bk ON b.book_id = bk.book_id
WHERE 
    b.return_date = CURDATE() + INTERVAL 2 DAY;

SELECT 
    b.borrow_id,
    br.name AS borrower_name,
    br.email,
    bk.title AS book_title,
    b.return_date
FROM 
    BorrowedBooks b
JOIN 
    Borrowers br ON b.borrower_id = br.borrower_id
JOIN 
    Books bk ON b.book_id = bk.book_id
WHERE 
    b.return_date < CURDATE();
