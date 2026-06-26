/*FOREIGN KEYS ---------------------------------------------------------------------------------------*/

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id) -- FOREIGN KEY
);

INSERT INTO customers (first_name, last_name, email)
VALUES
    ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES
    ('2016-02-10', 99.99, 1),
    ('2017-11-11', 35.50, 1),
    ('2014-12-12', 800.67, 2),
    ('2015-01-03', 12.50, 2),
    ('1999-04-11', 450.25, 5);
    
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2022-11-11', 78.99, 3);

# JOINS -------------------------------------------------------------------------------------------

/*CROSS JOINS*/
-- make every possible combination
-- e.g. we want all T-shirt sizes with colour table

-- but useless here:-(
SELECT * FROM customers, orders; -- don't want

/*INNER JOINS*/
-- return all(NOT NULL) related info! with one similarity - foreign key

SELECT * FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

/*INNER JOINS with GROUP BY*/

SELECT first_name, last_name, SUM(amount) AS total, COUNT(*) AS "orders" FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total DESC;

/*LEFT JOINS*/
-- return all(INCLUDING NULL) coressponding info! with one similarity - foreign key

SELECT *  FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT *  FROM orders
JOIN customers ON customers.id = orders.customer_id;

/*LEFT JOINS WITH GROUP BY*/


-- NULL check
-- Pure chore
SELECT first_name, last_name,
 CASE 
  WHEN SUM(amount) IS NULL THEN 0.00
  ELSE SUM(amount)
 END AS paid
FROM customers 
LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name;

-- easy version IFNULL(CONDITIONAL_VALUE, ALTERNATIVE_VALUE)
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS paid FROM customers 
LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name;
