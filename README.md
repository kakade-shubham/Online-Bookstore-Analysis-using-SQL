# 📚 Online Bookstore Analysis | SQL Project

<p align="center">
  <img src="https://img.shields.io/badge/Project-SQL%20Data%20Analysis-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Database-MySQL%20%7C%20SQL-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Advanced-success?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Domain-Retail%20%7C%20Bookstore-purple?style=for-the-badge" />
</p>

---

## 📌 Project Overview
This project is a **SQL-based data analysis project** built using an **Online Bookstore dataset**.  
It focuses on analyzing **books, customers, and orders** to extract meaningful business insights related to:

- 📖 Book inventory
- 👥 Customer behavior
- 🛒 Order patterns
- 💰 Revenue generation
- 📦 Stock availability

The project demonstrates the use of **basic to advanced SQL queries** to solve real-world business problems and generate actionable insights from structured data.

---

## 🎯 Objectives
The main goals of this project are to:

- Analyze bookstore inventory and stock levels
- Understand customer purchasing behavior
- Measure revenue generated from orders
- Identify frequently ordered books and top customers
- Practice SQL concepts using a real dataset
- Build a portfolio-ready SQL project for data analytics roles

---

## 🗂️ Dataset Information
This project uses the **Online Bookstore Analysis** dataset from Kaggle.

🔗 **Dataset Source:**  
[Online Bookstore Analysis Dataset on Kaggle](https://www.kaggle.com/datasets/komal1111/online-bookstore-analysis)

### Files Used
- `Books.csv`
- `Customers.csv`
- `Orders.csv`

---

## 🏗️ Database Schema

### 📚 Books Table
Contains book-related details:
- Book ID
- Title
- Author
- Genre
- Published Year
- Price
- Stock

### 👤 Customers Table
Contains customer information:
- Customer ID
- Name
- City
- Country

### 🛍️ Orders Table
Contains transaction details:
- Order ID
- Customer ID
- Book ID
- Order Date
- Quantity
- Total Amount

---

## 🛠️ Tools & Skills Used
- **SQL**
- **MySQL / Relational Database Concepts**
- **Joins**
- **Aggregate Functions**
- **GROUP BY / ORDER BY**
- **Filtering & Sorting**
- **Subqueries**
- **Business Insight Generation**

---

## ❓ SQL Questions Solved

### 🔹 Basic Queries
1. Retrieve all books in the **"Fiction"** genre  
2. Find books published after the year **1950**  
3. List all customers from **Canada**  
4. Show orders placed in **November 2023**  
5. Retrieve the **total stock** of books available  
6. Find the details of the **most expensive book**  
7. Show all customers who ordered **more than 1 quantity** of a book  
8. Retrieve all orders where the **total amount exceeds $20**  
9. List all **genres** available in the Books table  
10. Find the book with the **lowest stock**  
11. Calculate the **total revenue** generated from all orders  

### 🔸 Advanced Queries
1. Retrieve the **total number of books sold for each genre**  
2. Find the **average price** of books in the **Fantasy** genre  
3. List customers who have placed **at least 2 orders**  
4. Find the **most frequently ordered book**  
5. Show the **top 3 most expensive books** in the **Fantasy** genre  
6. Retrieve the **total quantity of books sold by each author**  
7. List the **cities** where customers who spent **over $30** are located  
8. Find the **customer who spent the most on orders**  
9. Calculate the **stock remaining after fulfilling all orders**

---

## 📈 Key Insights
Using SQL analysis, this project helps identify:

- 📚 Best-selling genres
- 🏆 Most frequently ordered books
- 👤 Customers with the highest spending
- 💵 Total revenue generated
- ✍️ Author-wise sales performance
- 📦 Books with low stock
- 🌍 Customer distribution by city and country
- 🧮 Remaining inventory after order fulfillment

---

## 💼 Business Use Cases
This analysis can support an online bookstore in:

- Inventory tracking and restocking decisions
- Identifying top-performing books and genres
- Understanding customer purchase behavior
- Monitoring sales and revenue
- Supporting promotional and pricing strategies

---

## 📁 Project Structure
```bash
Online-Bookstore-Analysis/
│
├── Books.csv
├── Customers.csv
├── Orders.csv
├── Online_Bookstore_SQL_Analysis.sql
└── README.md
