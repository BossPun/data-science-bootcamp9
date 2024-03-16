-- Create Blank table to fill in information

CREATE table customers (
  customer_no int,
  name text,
  age int,
  gender text,
  country text,
  salary int,
  PRIMARY KEY (customer_no)
);

CREATE table orders (
  order_id int,
  menu_name text,
  order_quantity int,
  order_date date,
  customer_no int
);

CREATE table menu (
  menu_id int,
  menu_name text,
  menu_price int
);
-- End of Createing table session


-- Fill in fiction data into customers table
INSERT into customers (customer_no,name,age,gender,country,salary) values
  (1,'John', 25, 'Male', 'USA', 15000),
  (2,'Mary', 30, 'Female', 'USA', 12000),
  (3,'Bob',60,'Male','France',20000),
  (4,'Alice',35,'Female','France',15000),
  (5,'Eve',30,'Female','Italy',12000),
  (6,'David',40,'Male','Italy',18000),
  (7,'Sam', 20, 'Male', 'United Kingdom', 12000),
  (8,'Tom', 45, 'Male', 'United Kingdom', 15000),
  (9,'Jerry', 30, 'Male','Denmark', 30000),
  (10,'Helen',25,'Female','Denmark',25000);

-- Fill in fiction data into customers table
INSERT into orders (order_id,menu_name,order_quantity,order_date,customer_no) values
  (1,'Pizza', 2, '2022-01-01', 1),
  (2,'Hamburger', 1, '2022-02-02', 2),
  (3,'Salad', 3, '2022-03-03', 3),
  (4,'Sandwich', 1, '2022-04-04', 4),
  (5,'Spaghetti', 2, '2022-05-05', 5),
  (6,'French Fries', 1, '2022-06-06', 6),
  (7,'Hamburger', 1, '2022-07-07', 7),
  (8,'Sandwich', 1, '2022-08-08', 8),
  (9,'Salad', 1, '2022-09-09', 9),
  (10,'Spaghetti', 1, '2022-10-10', 10),
  (1,'Coffee', 2, '2022-01-01', 1),
  (2,'Water', 1, '2022-02-02', 2),
  (3,'Tea', 3, '2022-03-03', 3),
  (4,'Tea', 1, '2022-04-04', 4),
  (5,'Water', 2, '2022-05-05', 5),
  (6,'Coffee', 1, '2022-06-06', 6),
  (7,'Water', 1, '2022-07-07', 7),
  (8,'Coffee', 1, '2022-08-08', 8),
  (9,'Tea', 1, '2022-09-09', 9),
  (10,'Coke', 1, '2022-10-10', 10),
  (1,'Cake', 2, '2022-01-01', 1),
  (2,'Ice Cream', 1, '2022-02-02', 2),
  (3,'Pan Cake', 3, '2022-03-03', 3),
  (4,'Pan Cake', 1, '2022-04-04', 4),
  (5,'Ice Cream', 2, '2022-05-05', 5),
  (6,'Ice Cream', 1, '2022-06-06', 6),
  (7,'Cake', 1, '2022-07-07', 7),
  (8,'Pan Cake', 1, '2022-08-08', 8),
  (9,'Cake', 1, '2022-09-09', 9),
  (10,'Ice Cream', 1, '2022-10-10', 10);

-- Fill in fiction data for menu table
INSERT into menu (menu_id,menu_name,menu_price) values
  (1,'Pizza', 500),
  (2,'Hamburger', 300),
  (3,'Salad', 150),
  (4,'Sandwich', 250),
  (5,'Spaghetti', 150),
  (6,'French Fries', 50),
  (7,'Coke', 80),
  (8,'Water', 20),
  (9,'Coffee', 80),
  (10,'Tea', 60),
  (11,'Cake',100),
  (12,'Ice Cream',80),
  (13,'Pan Cake',70);

--End Session for fill in fiction data in table

--Query for what menu did the customer ordered and how much added up for that order_id

SELECT 
  c.customer_no,
  c.name,
  c.age,
  c.gender,
  c.country,
  o.order_date,
  --subquery for adding up the menu_name
  (SELECT  GROUP_CONCAT(o.menu_name, ', ') AS ordered_menu
  FROM orders AS o
  GROUP BY o.order_id) AS ordered_menu,
  --subquery for adding up the menu_price
  SUM((m.menu_price * o.order_quantity)) AS total_price
  
FROM customers AS c
JOIN orders AS o ON c.customer_no = o.customer_no
JOIN menu AS m ON o.menu_name = m.menu_name
WHERE c.customer_no = 3;

--End of query

    

