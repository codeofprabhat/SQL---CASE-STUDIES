USE eight_week_sql_challenge;
DROP TABLE IF EXISTS customer, menuItems, orders;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  visit_date DATE,
  amount DECIMAL(10, 2)
);

CREATE TABLE menuItems (
  item_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  item_id INT,
  quantity INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);

INSERT INTO customers VALUES 
(1, 'John', '2024-01-01', 200.00),
(2, 'Maya', '2024-01-02', 180.00);

INSERT INTO menuItems VALUES
(1, 'Burger', 50.00),
(2, 'Fries', 30.00),
(3, 'Shake', 100.00);

INSERT INTO orders VALUES
(1, 1, 1, 2, '2024-01-01'),  -- John ordered 2 burgers
(2, 1, 2, 1, '2024-01-01'),  -- John ordered 1 fries
(3, 2, 3, 1, '2024-01-02');  -- Maya ordered 1 shake

SELECT * FROM customers
SELECT * FROM menuItems
SELECT * FROM orders

SHOW TABLES

-- 1. What is the total amount each customer spent at the restaurant?
SELECT customer_id,SUM(amount) AS total_sales
FROM customers
GROUP BY customer_id

-- 2. How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(visit_date) AS count_of_days
FROM customers
GROUP BY customer_id

-- 3. What was the first item from the menu purchased by each customer?
SELECT * FROM menuItems
SELECT * FROM customers
SELECT * FROM orders

WITH first_order AS (
    SELECT o.customer_id,c.name AS customer_name,m.name AS item_name, o.order_date
	FROM orders o
	JOIN menuItems m ON o.item_id=m.item_id
	JOIN customers c ON c.customer_id=o.customer_id
)
SELECT * FROM first_order

SELECT customer_id, MIN(order_date) AS first_order_date
FROM first_order
GROUP BY customer_id


























