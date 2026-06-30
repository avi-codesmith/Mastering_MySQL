/*WINDOW FUNCTIONS*/

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
-- OVER() -------------------------------------------------------------------------------------------------------------------------------------------------
-- Repeat aggregate result over and over.

SELECT department, AVG(salary) FROM employees GROUP BY department; -- normal GROUP BY
SELECT salary, MIN(salary), MAX(salary) FROM employees; -- won't work
SELECT salary, MIN(salary) OVER(), MAX(salary) OVER() FROM employees; -- with OVER() it works!!
-- reason a obvious!!

-- OVER() with PARTITION BY ----------------------------------------------------------------------------------------------------------------------------------------------

SELECT emp_no, department, salary, ROUND(AVG(salary) OVER()) AS avg_salary FROM employees;
-- return a column with rows of avegare salary.
SELECT emp_no, department, salary, 
ROUND(AVG(salary) OVER(PARTITION BY department)) AS department_salary,
ROUND(AVG(salary) OVER()),
COUNT(*) OVER(PARTITION BY department)
FROM employees;
-- return a column with rows of avegare salary partition by each department and
-- return a column with rows of avegare salary and
-- return a column with rows of avegare count partition by each department.

SELECT emp_no, department, salary, 
SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
SUM(salary) OVER() AS total_payroll 
FROM employees; 

-- OVER() with ORDER BY ------------------------------------------------------------------------------------------------------------------------------------------

SELECT department, salary, 
SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_sum_salary, 
SUM(salary) OVER(PARTITION BY department) AS total_salary
FROM employees;


SELECT department, salary, 
AVG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_max_salary 
FROM employees;

-- It will return rows <agg_function> rolling salary, calculated and pretended as ORDER BY DESC/ASC .
# rolling - previous salary vs current salary

# REAL LIFE USECASE
-- Find how much money has been earned so far.
SELECT order_date,
       amount,
       SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

/*RANK() --------------------------------------------------------------------------------------------------------------------------------*/
-- return rank- 1,2,3... rows according to ORDER BY [ASC|DESC]
-- It is not always consecutive, we could have ties,
-- Also it skip some rows when have ties, Like: 1, 2, 2, 4 - not consec. + skips
SELECT emp_no, department, salary,
 RANK() OVER(PARTITION BY department ORDER BY salary DESC)
  AS within_department,
 RANK() OVER(ORDER BY salary DESC)
  AS overall
FROM employees ORDER BY department;

/*ROW_NUMBER ----------------------------------------------------------------------------------------------------------------------------*/
-- It just return the row number with a new column and many rows
-- If there is tie, it doesn't matter
-- Always consecutive, bcz It ain't rank its just row number 
-- Like: 1, 2, 3, 4 - consec. + no skip
SELECT
    emp_no,
    department,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS `row's_number`
FROM employees;

/*DENSE_RANK() --------------------------------------------------------------------------------------------------------------------------------*/
-- return rank- 1,2,3... rows according to ORDER BY [ASC|DESC]
-- It is not always consecutive, we could have ties,
-- It never skip rows when have ties. Like 1, 2, 2, 3, 4 - neither consec. nor skip
-- Best for school's topper's rank
SELECT emp_no, department, salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS Ranks
FROM employees;

/*NTILE(n) ------------------------------------------------------------------------------------------------------------------------------------*/ 
-- NTILE - number of tile! and n = how many number of tile?  
-- make 'n' titles or chambers according to ORDER BY [ASC|DESC]
SELECT emp_no, department, salary, 
NTILE(3) OVER(PARTITION BY department ORDER BY salary DESC) AS quartile
FROM employees; -- 3 no. of tile.

/*FIRST_VALUE() ---------------------------------------------------------------------------------------------------------------------*/


