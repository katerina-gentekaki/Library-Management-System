# 📚 Library Management System — SQL Project

A beginner-friendly SQL project built using **MySQL** to simulate a Library Management System. This system demonstrates the use of relational databases to manage books, authors, borrowers, and borrowing transactions.

---

## 🛠️ Technologies Used

- **MySQL Workbench** (used for writing and running SQL scripts)
- **MySQL Server 8.0**


## 🧱 Database Schema

### 📘 Authors
- `author_id` (Primary Key)
- `name`
- `country`

### 📗 Books
- `book_id` (Primary Key)
- `title`
- `author_id` (Foreign Key → Authors)
- `published_year`

### 👤 Borrowers
- `borrower_id` (Primary Key)
- `name`
- `email`

### 📖 BorrowedBooks
- `borrow_id` (Primary Key)
- `book_id` (Foreign Key → Books)
- `borrower_id` (Foreign Key → Borrowers)
- `borrow_date`
- `return_date`

## 📊 SQL Query Examples

| Query No. | Description |
|----------|-------------|
| Q1 | Show the 5 most recently published books |
| Q2 | List all authors and their books |
| Q3 | Count how many books each author has written |
| Q4 | List all borrowers who have borrowed books |
| Q5 | Books borrowed by Alice |
| Q6 | Find books currently borrowed (not returned yet) |
| Q7 | Find borrowers who have borrowed more than 1 book |

➡️ See [`queries.sql`](./queries.sql) for all query code.

