--  DATABASE
CREATE DATABASE smart_retail_analytics;
USE smart_retail_analytics;

-- TABLES

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- ========== PHASE 3: TRANSACTION TABLES ==========

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    selling_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- DATA INSERTION

INSERT INTO customers (customer_id, full_name, email, city, country) VALUES
(1,'Amit Sharma','amit@gmail.com','Delhi','India'),
(2,'Neha Singh','neha@gmail.com','Mumbai','India'),
(3,'Rahul Verma','rahul@gmail.com','Pune','India'),
(4,'Anjali Mehta','anjali@gmail.com','Ahmedabad','India'),
(5,'Suresh Iyer','suresh@gmail.com','Chennai','India'),
(6,'Priya Nair','priya@gmail.com','Kochi','India'),
(7,'Rohit Gupta','rohit@gmail.com','Noida','India'),
(8,'Kunal Jain','kunal@gmail.com','Jaipur','India'),
(9,'Simran Kaur','simran@gmail.com','Amritsar','India'),
(10,'Vikas Malhotra','vikas@gmail.com','Delhi','India'),
(11,'John Smith','john@gmail.com','New York','USA'),
(12,'Emma Brown','emma@gmail.com','London','UK'),
(13,'Daniel Lee','daniel@gmail.com','Seoul','South Korea'),
(14,'Sophia Wilson','sophia@gmail.com','Sydney','Australia'),
(15,'Carlos Diaz','carlos@gmail.com','Madrid','Spain'),
(16,'Riya Das','riya@gmail.com','Kolkata','India'),
(17,'Arjun Patel','arjun@gmail.com','Surat','India'),
(18,'Nikhil Rao','nikhil@gmail.com','Bangalore','India'),
(19,'Pooja Kulkarni','pooja@gmail.com','Nagpur','India'),
(20,'Mohit Bansal','mohit@gmail.com','Gurgaon','India'),
(21,'Ayesha Khan','ayesha@gmail.com','Hyderabad','India'),
(22,'Farhan Ali','farhan@gmail.com','Lucknow','India'),
(23,'Sneha Joshi','sneha@gmail.com','Indore','India'),
(24,'Abhishek Roy','abhishek@gmail.com','Patna','India'),
(25,'Manish Tiwari','manish@gmail.com','Bhopal','India'),
(26,'Kevin White','kevin@gmail.com','Chicago','USA'),
(27,'Olivia Martin','olivia@gmail.com','Paris','France'),
(28,'Noah Kim','noah@gmail.com','Busan','South Korea'),
(29,'Liam Scott','liam@gmail.com','Toronto','Canada'),
(30,'Mia Lopez','mia@gmail.com','Mexico City','Mexico'),
(31,'Sanjay Kumar','sanjay@gmail.com','Ranchi','India'),
(32,'Deepak Yadav','deepak@gmail.com','Varanasi','India'),
(33,'Isha Arora','isha@gmail.com','Faridabad','India'),
(34,'Tina Shah','tina@gmail.com','Vadodara','India'),
(35,'Harish Reddy','harish@gmail.com','Warangal','India'),
(36,'Robert King','robert@gmail.com','Boston','USA'),
(37,'Isabella Moore','isabella@gmail.com','Rome','Italy'),
(38,'Lucas Silva','lucas@gmail.com','Sao Paulo','Brazil'),
(39,'Ethan Young','ethan@gmail.com','Dublin','Ireland'),
(40,'Grace Hall','grace@gmail.com','Manchester','UK'),
(41,'Aakash Jain','aakash@gmail.com','Udaipur','India'),
(42,'Naina Kapoor','naina@gmail.com','Chandigarh','India'),
(43,'Yogesh Pawar','yogesh@gmail.com','Nashik','India'),
(44,'Ritu Saxena','ritu@gmail.com','Meerut','India'),
(45,'Kartik Mishra','kartik@gmail.com','Kanpur','India'),
(46,'Benjamin Clark','ben@gmail.com','Seattle','USA'),
(47,'Chloe Turner','chloe@gmail.com','Bristol','UK'),
(48,'Henry Adams','henry@gmail.com','Austin','USA'),
(49,'Ella Green','ella@gmail.com','Leeds','UK'),
(50,'Ryan Walker','ryan@gmail.com','Denver','USA');


INSERT INTO categories (category_id, category_name) VALUES
(1,'Electronics'),
(2,'Groceries'),
(3,'Fashion'),
(4,'Home Appliances'),
(5,'Books'),
(6,'Beauty'),
(7,'Sports'),
(8,'Toys'),
(9,'Furniture'),
(10,'Stationery');


INSERT INTO products (product_id, product_name, category_id, price, stock) VALUES
(101,'Laptop',1,55000,100),
(102,'Smartphone',1,32000,200),
(103,'Headphones',1,2500,300),
(104,'Smart Watch',1,7000,150),
(105,'Bluetooth Speaker',1,4000,180),
(106,'Rice 10kg',2,1200,500),
(107,'Wheat Flour',2,900,400),
(108,'Cooking Oil',2,1500,350),
(109,'Sugar 5kg',2,600,300),
(110,'Salt 1kg',2,40,800),
(111,'T-Shirt',3,800,500),
(112,'Jeans',3,1800,350),
(113,'Jacket',3,3500,200),
(114,'Kurta',3,1500,250),
(115,'Shoes',3,2800,300),
(116,'Microwave Oven',4,12000,100),
(117,'Refrigerator',4,28000,80),
(118,'Washing Machine',4,24000,90),
(119,'Air Conditioner',4,42000,60),
(120,'Water Purifier',4,15000,110),
(121,'Python Book',5,650,400),
(122,'SQL Handbook',5,550,350),
(123,'ML Guide',5,900,250),
(124,'Notebook Set',10,300,600),
(125,'Pen Pack',10,120,700),
(126,'Face Cream',6,450,300),
(127,'Shampoo',6,380,350),
(128,'Perfume',6,2200,200),
(129,'Cricket Bat',7,2500,150),
(130,'Football',7,1800,200),
(131,'Toy Car',8,600,300),
(132,'Doll',8,750,280),
(133,'Office Chair',9,8500,90),
(134,'Study Table',9,12500,70),
(135,'Marker Set',10,250,400);


INSERT INTO orders (order_id, customer_id, order_date, order_status) VALUES
(1001,1,'2025-01-01','Delivered'),
(1002,2,'2025-01-02','Delivered'),
(1003,3,'2025-01-03','Cancelled'),
(1004,4,'2025-01-04','Delivered'),
(1005,5,'2025-01-05','Pending'),
(1006,6,'2025-01-06','Delivered'),
(1007,7,'2025-01-07','Delivered'),
(1008,8,'2025-01-08','Delivered'),
(1009,9,'2025-01-09','Returned'),
(1010,10,'2025-01-10','Delivered'),
(1011,11,'2025-01-11','Delivered'),
(1012,12,'2025-01-12','Pending'),
(1013,13,'2025-01-13','Delivered'),
(1014,14,'2025-01-14','Delivered'),
(1015,15,'2025-01-15','Cancelled'),
(1016,16,'2025-01-16','Delivered'),
(1017,17,'2025-01-17','Delivered'),
(1018,18,'2025-01-18','Delivered'),
(1019,19,'2025-01-19','Pending'),
(1020,20,'2025-01-20','Delivered'),
(1021,21,'2025-01-21','Delivered'),
(1022,22,'2025-01-22','Delivered'),
(1023,23,'2025-01-23','Returned'),
(1024,24,'2025-01-24','Delivered'),
(1025,25,'2025-01-25','Delivered'),
(1026,26,'2025-01-26','Delivered'),
(1027,27,'2025-01-27','Delivered'),
(1028,28,'2025-01-28','Pending'),
(1029,29,'2025-01-29','Delivered'),
(1030,30,'2025-01-30','Delivered'),
(1031,31,'2025-02-01','Delivered'),
(1032,32,'2025-02-02','Cancelled'),
(1033,33,'2025-02-03','Delivered'),
(1034,34,'2025-02-04','Delivered'),
(1035,35,'2025-02-05','Pending'),
(1036,36,'2025-02-06','Delivered'),
(1037,37,'2025-02-07','Delivered'),
(1038,38,'2025-02-08','Returned'),
(1039,39,'2025-02-09','Delivered'),
(1040,40,'2025-02-10','Delivered'),
(1041,41,'2025-02-11','Delivered'),
(1042,42,'2025-02-12','Delivered'),
(1043,43,'2025-02-13','Pending'),
(1044,44,'2025-02-14','Delivered'),
(1045,45,'2025-02-15','Delivered'),
(1046,46,'2025-02-16','Delivered'),
(1047,47,'2025-02-17','Delivered'),
(1048,48,'2025-02-18','Cancelled'),
(1049,49,'2025-02-19','Delivered'),
(1050,50,'2025-02-20','Delivered');


INSERT INTO order_items (order_id, product_id, quantity, selling_price) VALUES
(1001,101,1,54000),
(1001,111,2,750),
(1002,102,1,31000),
(1002,106,3,1150),
(1003,121,1,600),
(1004,103,2,2400),
(1004,124,4,280),
(1005,116,1,11800),
(1006,107,2,880),
(1006,112,1,1750),
(1007,129,1,2400),
(1008,133,1,8300),
(1009,131,2,580),
(1010,135,5,230),
(1011,101,1,54500),
(1012,126,2,420),
(1013,117,1,27500),
(1014,118,1,23500),
(1015,122,2,520),
(1016,108,3,1450),
(1017,109,2,580),
(1018,110,5,38),
(1019,114,1,1450),
(1020,115,1,2700),
(1021,104,1,6800),
(1022,105,2,3900),
(1023,128,1,2100),
(1024,132,2,720),
(1025,130,1,1700),
(1026,123,1,880),
(1027,119,1,41000),
(1028,120,1,14800),
(1029,127,2,360),
(1030,134,1,12000),
(1031,106,4,1100),
(1032,121,1,620),
(1033,103,1,2450),
(1034,104,2,6900),
(1035,112,2,1780),
(1036,133,1,8400),
(1037,135,6,240),
(1038,131,3,600),
(1039,129,1,2500),
(1040,130,2,1750),
(1041,118,1,23800),
(1042,107,3,890),
(1043,108,1,1480),
(1044,124,5,290),
(1045,125,4,110),
(1046,101,1,55000),
(1047,114,1,1500),
(1048,122,2,540),
(1049,127,3,370),
(1050,128,1,2150);


-- WHERE Clause (Filtering Records)
-- 1. Customers from India
SELECT * 
FROM customers 
WHERE country = 'India';

-- 2. Orders that are Delivered
SELECT * 
FROM orders 
WHERE order_status = 'Delivered';

-- 3. Products priced above 10,000
SELECT * 
FROM products 
WHERE price > 10000;

-- 4. Orders placed in February 2025
SELECT * 
FROM orders 
WHERE order_date BETWEEN '2025-02-01' AND '2025-02-28';

-- 5. Customers from Delhi or Mumbai
SELECT * 
FROM customers 
WHERE city IN ('Delhi','Mumbai');



-- GROUP BY Clause (Aggregation)

-- 1. Total customers per country
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

-- 2. Total orders per order_status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- 3. Total quantity sold per product
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;

-- 4. Revenue generated per product
SELECT product_id, SUM(quantity * selling_price) AS total_revenue
FROM order_items
GROUP BY product_id;

-- 5. Orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;



-- HAVING Clause (Filtering Aggregates)
-- 1. Products sold more than 3 times
SELECT product_id, SUM(quantity) AS total_qty
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > 3;

-- 2. Customers having more than 1 order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3. Categories generating revenue > 50000
SELECT p.category_id, SUM(oi.quantity * oi.selling_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category_id
HAVING revenue > 50000;

-- 4. Cities with more than 2 customers
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;



-- ORDER BY Clause (Sorting)
-- 1. Top expensive products
SELECT * 
FROM products 
ORDER BY price DESC;

-- 2. Latest orders first
SELECT * 
FROM orders 
ORDER BY order_date DESC;

-- 3. Highest selling revenue products
SELECT product_id, SUM(quantity * selling_price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;

-- 4. Customers sorted by city
SELECT * 
FROM customers
ORDER BY city;




-- SUBQUERY (Nested Query)
-- 1. Products priced above average price
SELECT * 
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 2. Customers who placed orders
SELECT * 
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 3. Products never sold
SELECT * 
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

-- 4. Highest order value product
SELECT *
FROM products
WHERE product_id = (
    SELECT product_id 
    FROM order_items
    ORDER BY selling_price DESC
    LIMIT 1
);

-- 5. Customers who placed highest number of orders
SELECT *
FROM customers
WHERE customer_id = (
    SELECT customer_id 
    FROM orders
    GROUP BY customer_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- INNER JOIN
-- 1. Customer order details
SELECT c.full_name, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Order item details with product name
SELECT oi.order_id, p.product_name, oi.quantity
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;

-- 3. Category wise sales
SELECT cat.category_name, SUM(oi.quantity * oi.selling_price) AS revenue
FROM categories cat
INNER JOIN products p ON cat.category_id = p.category_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY cat.category_name;



-- LEFT OUTER JOIN
-- 1. All customers and their orders (including customers with no orders)
SELECT c.full_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Products and their sales
SELECT p.product_name, oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

-- 3. Categories without any products
SELECT cat.*
FROM categories cat
LEFT JOIN products p ON cat.category_id = p.category_id
WHERE p.product_id IS NULL;



-- RIGHT OUTER JOIN
-- 1. Orders and customer info
SELECT c.full_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Products sold even if product data missing
SELECT p.product_name, oi.quantity
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;



-- FULL OUTER JOIN (MySQL Alternative Using UNION)
SELECT c.customer_id, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


-- CROSS JOIN (Cartesian Product)
-- 1. All product-category combinations
SELECT p.product_name, c.category_name
FROM products p
CROSS JOIN categories c;

-- 2. All customer-product combinations
SELECT c.full_name, p.product_name
FROM customers c
CROSS JOIN products p;


-- SELF JOIN
-- 1. Customers from same city
SELECT A.full_name, B.full_name, A.city
FROM customers A
JOIN customers B
ON A.city = B.city AND A.customer_id <> B.customer_id;

-- 2. Customers from same country
SELECT A.full_name, B.full_name, A.country
FROM customers A
JOIN customers B
ON A.country = B.country AND A.customer_id < B.customer_id;


-- NATURAL JOIN
-- 1. Customers and orders
SELECT *
FROM customers
NATURAL JOIN orders;

-- 2. Products and categories
SELECT *
FROM products
NATURAL JOIN categories;



-- ANTI JOIN (NOT EXISTS / NOT IN)
SELECT *
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);



-- Right Anti Join (Orders without customers)
SELECT *
FROM orders o
WHERE NOT EXISTS (
    SELECT 1 FROM customers c WHERE c.customer_id = o.customer_id
);


-- NON-EQUI JOIN
-- 1. Products where selling price > original price
SELECT p.product_name, oi.selling_price, p.price
FROM products p
JOIN order_items oi
ON oi.product_id = p.product_id
AND oi.selling_price > p.price;

-- 2. High discount products
SELECT p.product_name, oi.selling_price, p.price
FROM products p
JOIN order_items oi
ON oi.product_id = p.product_id
AND (p.price - oi.selling_price) > 500;



-- ADVANCED ANALYTICS QUERIES
-- Top 5 revenue generating products
SELECT p.product_name, SUM(oi.quantity * oi.selling_price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Monthly sales report
SELECT MONTH(o.order_date) AS month, 
       SUM(oi.quantity * oi.selling_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date);

-- Repeat customers
SELECT customer_id, COUNT(*) AS orders_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;


