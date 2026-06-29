-- CREATE AND ACCESS DATABASE --
CREATE DATABASE library;
USE library;

-- CREATING A TABLE --
CREATE TABLE books(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
isbn VARCHAR(20)  UNIQUE,
price DECIMAL(5,2),
published_date DATE,
in_stock INT DEFAULT 1
);

-- INSERTING VALUES INTO TABLE --
INSERT INTO books (title,isbn,price,published_date,in_stock) VALUES
('History of Pravi','1901',500.50,'2005-12-19',2),
('Anatomy of Life','1920',700,'2024-05-19',2),
('History of Asus','3800',450.90,'2022-11-02',1),
('Farmer','2031',800,'2019-05-30',2);

INSERT INTO books (title,isbn,price,published_date) VALUES
('Peace','2015',900,'2021-08-20'),
('Life of PI','2020',850,'2024-02-14');

-- DISPLAY TABLE VALUES --
SELECT * FROM books;

-- RENAME COLUMN NAME --
ALTER TABLE books RENAME COLUMN title TO book_title;

-- CHANGING COLUMN DATA TYPE --
ALTER TABLE books  MODIFY price float;

-- ADDING NEW COLUMN --
ALTER TABLE books ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'Unknown';

-- UPDATE EXISTING DATA --
UPDATE books SET price = price *0.9 WHERE published_date < '2020-01-01';

-- DELETING A RECORD WHEN STOCK IS 0 --
UPDATE books SET in_stock = 0 WHERE isbn = 2015;
DELETE FROM books WHERE in_stock =0;

-- RESET AUTO_INCREMENT FROM STARTING --
ALTER TABLE Books AUTO_INCREMENT = 101;

-- DISPLAY THE BOOKS NAMED HISTORY AND THAT'S PRICE >300 --
SELECT book_title,price,published_date FROM Books WHERE book_title LIKE '%History%' AND price > 300 ORDER BY price DESC;

-- NEW TABLE CREATION --
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- INSERTING VALUES INTO TABLE --
INSERT INTO Members (member_name, join_date)
VALUES
('Praveen', '2024-01-15'),
('Kumar', '2023-12-20'),
('Maneesh', '2024-06-10'),
('Siva', '2022-08-18'),
('Vijay', '2024-11-05'),
('Rahul', '2025-02-14'),
('Tom', '2024-03-28'),
('Alex', '2021-07-30');

-- MEMBERS TABLE VALUE --
SELECT * FROM Members WHERE YEAR(join_date) = 2024 ORDER BY member_name ASC;