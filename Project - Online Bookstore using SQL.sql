SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS SQL_Project;
USE SQL_Project;
SHOW TABLES;
-- Creating a book table 
CREATE TABLE IF NOT EXISTS Books
(
	BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10,2),
    Stock INT
);

-- Creating a customer table
CREATE TABLE IF NOT EXISTS Customers
(
	CustomerID INT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Creating Orders table
CREATE TABLE IF NOT EXISTS Orders
(
	OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    BookID INT,
    Order_Date VARCHAR(30),
    Quantity INT,
    Total_amount NUMERIC(10,2)
);

ALTER TABLE Orders
MODIFY COLUMN Order_Date DATE;

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders FOREIGN KEY(CustomerID)
REFERENCES Customers (CustomerID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Ord_Book FOREIGN KEY(BookID)
REFERENCES Books (BookID);
-- Import data- Expand SQL_Project-->Right click on Books table-->Table data import wizard-->select path & read next instructions-->Click Finish

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--------------------------   Basic Queries ---------------------------


-- 1) Retrieve all books in the "Fiction" genre

SELECT *
FROM Books
WHERE Genre = 'Fiction';

-- 2) Find books published after the year 1950

SELECT *
FROM Books
WHERE Published_Year > 1950;

-- 3) List all customers from the Canada

SELECT *
FROM Customers
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023

SELECT *
FROM Orders
WHERE Order_date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY Order_Date;

-- 5) Retrieve the total stock of books available

SELECT SUM(Stock) AS Total_book_Stock
FROM Books;

-- 6) Find the details of the most expensive book

SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 1;

-- OR

SELECT BookID,Title,MAX(Price) AS Expensive_Book
FROM Books; 

-- 7) Show all customer who ordered more than 1 quantity of a book

SELECT DISTINCT(C.CustomerID),C.Name,C.Email
FROM Customers AS C
JOIN Orders AS O
ON O.CustomerID = C.CustomerID
WHERE Quantity > 1;

-- OR

SELECT *
FROM Orders
WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20

SELECT * 
FROM Orders
WHERE Total_amount > 20.00;

-- 9) List all genres available in the Books table

SELECT Genre
FROM Books
GROUP BY Genre;

-- OR

SELECT DISTINCT(Genre) AS Genre
FROM Books;

-- 10) Find the book with the lowest stock

SELECT BookID,Title,Author,Stock
FROM Books
ORDER BY Stock ASC
LIMIT 5;

-- OR

SELECT BookID,Title,Stock
FROM Books
WHERE Stock < 6
ORDER BY Stock;

-- 11) Calculate the total revenue generated from all orders

SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;


--------------------------   Advance Queries ---------------------------

-- 1) Retrieve the total number of books sold for each genre

SELECT B.Genre,SUM(O.Quantity) AS Sold_Quantity
FROM Books AS B
INNER JOIN Orders AS O
ON B.BookID = O.BookID
GROUP BY B.Genre
ORDER BY Sold_Quantity DESC;


-- 2) Find the average price of books in the "Fantasy" genre

SELECT ROUND(AVG(Price),2) AS "Average Price of Fantasy"
FROM Books
WHERE Genre = 'Fantasy';


-- 3) List customers who have placed at least 2 orders

SELECT C.*, COUNT(O.OrderID) AS Quantity
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerId
GROUP BY CustomerID
HAVING COUNT(O.Quantity) >= 2
ORDER BY C.CustomerID;

-- OR

SELECT C.CustomerID,C.Name,COUNT(O.OrderID) AS Total_Ordered
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,C.Name
HAVING COUNT(O.OrderID) > 1
ORDER BY C.CustomerID;


-- 4) Find the most frequently ordered book

SELECT O.BookID,B.Title,B.Author,SUM(O.Quantity) AS total_ordered
FROM Books AS B
INNER JOIN Orders AS O
ON B.BookID = O.BookID
GROUP BY B.BookID,B.Title,B.Author
ORDER BY total_Ordered DESC,O.BookID ASC
LIMIT 5;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre

SELECT BookID,Title,Genre,Price
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;


-- 6) Retrieve the total quantity of books sold by each author

SELECT B.Author,SUM(O.Quantity) AS Total_Quantity
FROM Books AS B
INNER JOIN Orders AS O
ON O.BookID = B.BookID
GROUP BY B.Author
ORDER BY Total_Quantity DESC;


-- 7) List the cities where customers who spent over $30 are located.

SELECT DISTINCT(C.City),Total_Amount
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE Total_Amount > 30
ORDER BY Total_Amount DESC;

-- OR

SELECT ROW_NUMBER() OVER() AS 'Sr.No.',C.City,Total_Amount
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE Total_Amount > 30
ORDER BY Total_amount DESC;

-- OR

SELECT C.CustomerID,C.Name,C.City,Total_Amount
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE Total_Amount > 30
ORDER BY Total_Amount DESC;


-- 8) Find the customer who spent the most on orders

SELECT C.CustomerID,C.Name,SUM(O.Total_Amount) AS Total_Spent
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,C.Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders

-- (Showing Stock,Orders and remaining stock)

SELECT B.BookID,
	B.Title,
	B.Stock,
    COALESCE(SUM(O.Quantity),0) AS Order_Quantity,
    B.Stock - COALESCE(SUM(O.Quantity),0) AS Remaining_Stock
FROM Books AS B
LEFT JOIN Orders AS O
ON B.BookID = O.BookID
GROUP BY B.BookID,B.Title,B.Stock
ORDER BY B.BookID ASC;

