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

