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