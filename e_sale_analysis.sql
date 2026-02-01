DROP DATABASE IF EXISTS e_sale_analysis;
# CREATE DATABASE
CREATE DATABASE e_sale_analysis;


USE e_sale_analysis;
#CREATE TABLES & FOREIGN KEYS
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name_category` varchar(100) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customers` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_birth` date NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `date_registration` datetime NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_category_id_idx` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_items` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id_order_item`),
  KEY `fk_order_id_idx` (`order_id`),
  KEY `fk_product_id_idx` (`product_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

# INSERT SAMPLE DATA

-- CATEGORIES
INSERT INTO categories (name_category) VALUES ('Clothing'),('Shoes'), ('Accessories');
SELECT * FROM categories;

-- CUSTOMER
INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Marina', 'Kovacevic', '1992-03-09', 'marina.kovacevic@gmail.com', 'Serbia', 'Indjija', '2020-09-10 14:30:00');

INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Ivana', 'Banovic', '1992-05-25', 'banovic.ivana@gmail.com', 'Serbia', 'Subotica', '2025-01-15 10:12:05');

INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Petar', 'Petrovic', '2000-02-11', 'p.petrovic@yahoo.com', 'Serbia', 'Belgrade', '2026-01-05 18:20:07');

INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Ana', 'Nikolic', '1993-06-12', 'ana.nn@gmail.com', 'Serbia', 'Novi Sad', '2023-02-10 08:13:00');

INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Nikola', 'Savic', '1988-10-03', 'nikola.savic@yahoo.com', 'Serbia', 'Belgrade', '2022-03-22 16:45:00');

INSERT INTO customers
(first_name, last_name, date_birth, e_mail, country, city, date_registration)
VALUES
('Jelena', 'Stojanovic', '1991-01-19', 's.jelena@gmail.com', 'Serbia', 'Kragujevac', '2021-08-01 12:15:00');

SELECT * FROM customers;


-- PRODUCTS
INSERT INTO products
(product_name, cost, price, category_id)
VALUES
('Dress', '3000','5400',1),
('leather boots', '11000','19800',2),
('Sneakers', '7000','12600',3),
('Handbag', '11000','19800',1);
INSERT INTO products
(product_name, cost, price, category_id)
VALUES
('Men Belt', 2500, 4500, 3),
('Men Wallet', 3900, 7000, 3),
('Men T-Shirt', 2800, 5000, 1);

update products set product_name= 'Leather Boots' where id_product=2;
UPDATE products SET category_id = 2 WHERE id_product = '3';
UPDATE products SET category_id = 3 WHERE id_product = '4';
SELECT * FROM products;

-- ORDERS
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2024-06-20 11:55:00','Completed',1);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2025-01-16 14:20:10','Completed',2);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2026-01-18 08:15:30','Completed',3);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2026-01-20 12:15:30','Pending',3);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2024-04-11 12:20:00', 'Completed', 4);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES ('2024-05-15 17:40:00', 'Completed', 4);

INSERT INTO orders
(order_date, order_status, customer_id) VALUES('2023-11-01 11:20:00', 'Completed', 5);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES('2024-02-20 13:30:20', 'Completed', 5);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES('2026-01-22 09:50:15', 'Pending', 5);

INSERT INTO orders
(order_date, order_status, customer_id) VALUES('2025-02-10 12:20:00', 'Completed', 6);
INSERT INTO orders
(order_date, order_status, customer_id) VALUES('2025-03-05 18:45:00', 'Completed', 6);

SELECT * FROM orders;

-- ORDER_ITEMS
INSERT INTO order_items
(quantity, order_id, product_id)
VALUES
(2, 1, 1),
(2, 1, 4),
(1, 2, 2),
(1, 3, 3),
(1, 3, 5),
(1, 3, 6),
(1, 4, 7),
(2, 5, 2),
(1, 5, 4),
(1, 6, 1),
(3, 7, 7),
(1, 8, 6),
(1, 9, 5),
(1, 10, 4),
(1, 11, 2),
(2, 11, 1);
SELECT * FROM order_items;

-- CHECK DATA IN ALL TABLES
SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


#SALES & REVENUE

-- total value of each order
SELECT orders.id_order, orders.order_date, sum(order_items.quantity *products.price ) as order_total FROM orders JOIN order_items
ON orders.id_order=order_items.order_id
 JOIN products ON products.id_product= order_items.product_id group by orders.id_order, orders.order_date ORDER BY order_total desc;

-- sum all orders
SELECT sum(products.price * order_items.quantity) AS total_revenue from products join order_items on products.id_product= order_items.product_id;

#CUSTOMER ANALYSIS QUERIES

-- Customer Revenue (Who spent the most)
-- For complex SELECT queries with multiple JOINs and GROUP BY,
-- a VIEW is created so the logic is reusable and easier to maintain.
-- Tables joined: customers - orders - order_items - products

-- Order overview with customer information
	
select customers.id_customer,customers.first_name, customers.last_name, customers.e_mail,sum(products.price * order_items.quantity) AS customer_revenue
from
customers join orders on customers.id_customer=orders.customer_id 
join order_items on orders.id_order=order_items.order_id
join products on products.id_product= order_items.product_id
group by customers.id_customer,customers.first_name, customers.last_name, customers.e_mail
order by customer_revenue DESC;

	-- VIEW
CREATE VIEW customer_revenue_view AS
select customers.id_customer , customers.first_name, customers.last_name,sum(products.price * order_items.quantity) AS customer_revenue 
from customers join orders on customers.id_customer=orders.customer_id 
join order_items on orders.id_order = order_items.order_id
join products on products.id_product=order_items.product_id
GROUP BY customers.id_customer, customers.first_name, customers.last_name;

	-- Customer with the highest total revenue
SELECT id_customer,first_name, customer_revenue
FROM customer_revenue_view
ORDER BY customer_revenue DESC;
	
    -- Customers with total revenue greater than 20,000
SELECT *
FROM customer_revenue_view
WHERE customer_revenue > 20000 ORDER BY customer_revenue DESC; 

	-- Customer who has more than 1 order
select customers.id_customer, customers.first_name, customers.last_name,customers.e_mail, count(orders.id_order) as total_orders
from
customers join orders on customers.id_customer=orders.customer_id
group by customers.id_customer, customers.first_name, customers.last_name,customers.e_mail
having total_orders >1 ORDER BY total_orders DESC;

			-- Order Overview with Customer Details
-- Order details including products, quantities and item total value
select customers.id_customer,customers.first_name, customers.last_name, customers.e_mail, orders.id_order, orders.order_date, orders.order_status, products.product_name,products.price,order_items.quantity,(products.price * order_items.quantity) AS item_total
FROM
customers join orders on customers.id_customer=orders.customer_id 
join order_items on orders.id_order=order_items.order_id
join products on products.id_product= order_items.product_id;


-- Total value of each order using GROUP BY and SUM
select orders.id_order, orders.order_date, orders.order_status, sum(products.price * order_items.quantity) AS order_total
FROM
orders join order_items on orders.id_order=order_items.order_id
join products on products.id_product= order_items.product_id
group by orders.id_order, orders.order_date, orders.order_status
ORDER BY orders.id_order;

-- Orders with total value greater than 20,000
-- HAVING is used to filter aggregated results
select orders.id_order, orders.order_date,  SUM(products.price * order_items.quantity) AS order_total
from
orders join order_items on orders.id_order=order_items.order_id 
join products on products.id_product= order_items.product_id
group by orders.id_order, orders.order_date
having order_total> 20000 ORDER BY order_total DESC;
# CATEGORY REVENUE
select categories.id_category, categories.name_category, SUM(products.price * order_items.quantity) AS category_revenue
from
categories join products on categories.id_category = products.category_id 
join order_items on products.id_product= order_items.product_id
group by categories.id_category, categories.name_category
order by category_revenue DESC;

# TOP PRODUCTS
-- total_revenue
select products.id_product, products.product_name, sum(order_items.quantity) total_quantity, SUM(products.price * order_items.quantity) AS total_revenue
FROM products join order_items on products.id_product= order_items.product_id
group by products.id_product, products.product_name
order by total_revenue DESC
limit 10;
-- total_quantity
select products.id_product, products.product_name, sum(order_items.quantity) as total_quantity, SUM(products.price * order_items.quantity) AS total_revenue
FROM products join order_items on products.id_product= order_items.product_id
group by products.id_product, products.product_name
order by total_quantity DESC
limit 15;

# ORDER BEHAVIOR
-- Total Orders By Customer
select customers.id_customer, customers.first_name, customers.last_name,customers.e_mail, count(orders.id_order) as total_orders
from
customers join orders on customers.id_customer=orders.customer_id
group by customers.id_customer, customers.first_name, customers.last_name,customers.e_mail
order by total_orders DESC;

-- Average Order Value (AOV)
select customers.id_customer, customers.first_name, customers.last_name,customers.e_mail, SUM(products.price * order_items.quantity)/ count(distinct orders.id_order) as AOV
from customers join orders on customers.id_customer=orders.customer_id 
join order_items on orders.id_order=order_items.order_id 
join products on products.id_product= order_items.product_id
group by customers.id_customer, customers.first_name, customers.last_name,customers.e_mail
order by AOV DESC;

