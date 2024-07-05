create database antigua_ltd;
use antigua_ltd;

create table commodity(
commodity_id INT PRIMARY KEY,
commodity_name VARCHAR(40),
retail_cost VARCHAR(20)
);

create table supplier(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(40),
town VARCHAR(30)
);

create table orders(
order_id INT PRIMARY KEY,
commodity_id INT,
FOREIGN KEY(commodity_id) REFERENCES commodity(commodity_id),---one to many relationship---
supplier_id INT,
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id),
order_date DATE
);

INSERT INTO commodity (commodity_id, commodity_name, retail_cost) VALUES
(10, 'Apple Vinegar Super', 400),
(20, 'Assorted Sandwich', 300),
(30, 'Sweetener Max', 130),
(40, 'Soda 1L', 120),
(50, 'UPS APC 2', 5000),
(60, 'Persil Detergent', 130),
(70, 'Minute Maid', 120),
(80, 'Pizza XL', 1000),
(90, 'Sancho Water 5L', 650),
(100, 'UPS APC 1', 3000);

INSERT INTO supplier (supplier_id, supplier_name, town) VALUES
(11, 'Antigua Foods', 'Nakuru'),
(12, 'Prime Foods', 'Nairobi'),
(13, 'Gilanis Mart', 'Nairobi'),
(14, 'Power Dynamics Ltd', 'Eldorert'),
(15, 'Panda Energy', 'Nakuru'),
(16, 'SAHICO', 'Kabarnet'),
(17, 'Rio Beverages', 'Nakuru');

INSERT INTO orders(order_id, commodity_id, supplier_id, order_date) VALUES
(101, 10, 11, '2023-04-12'),
(102, 20, 12, '2023-04-22'),
(103, 30, 11, '2023-04-12'),
(104, 40, 12, '2023-05-24'),
(105, 50, 14, '2024-01-15'),
(106, 60, 16, '2023-09-17'),
(107, 70, 17, '2023-08-19'),
(108, 80, 13, '2024-03-11'),
(109, 90, 15, '2024-02-02'),
(110, 100, 13, '2024-05-04');

SELECT * FROM supplier;
SELECT * FROM commodity;
SELECT * FROM orders;

SELECT o.order_id, c.commodity_name, c.retail_cost, s.supplier_name, s.town, o.order_date
FROM orders o
JOIN commodity c ON o.commodity_id = c.commodity_id
JOIN supplier s ON o.supplier_id = s.supplier_id;

