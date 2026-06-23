/* AGGREGATE FUNCTIONS */

/* COUNT ------------------------------------------------------------------------------------------------*/

SELECT COUNT(*) FROM books; -- count all rows which is "19"
-- 19
SELECT COUNT(author_fname) FROM books; -- count all author_fname which is "19" too
-- 19

INSERT INTO books(author_fname) values(NULL); 
-- (adding null)

SELECT COUNT(*) FROM books; -- count all rows then thay are 21 ("two times added null")
-- null included two times 19 --> 21, (total rows - 21)

SELECT COUNT(author_fname) FROM books; -- count all author_fname which is "19" too
-- 19 (null not included bcz there are only 19 names) (total auhthor names remian 19)

SELECT * FROM books;

# with LIKE keyword

SELECT COUNT(*) FROM books WHERE title LIKE "%the%";

/* GROUP BY - grouping -----------------------------------------------------------------------------------------------*/

SELECT author_lname, COUNT(*) AS books_written 
FROM books
GROUP BY author_lname 
ORDER BY books_written DESC;

SELECT released_year, COUNT(*) AS books_released FROM books GROUP BY released_year ORDER BY books_released DESC, 1 DESC; 

-- selection and grouping column should be same!!!!!!!

/*MIN MAX*/
-- In strings - use alphabetical order :D

SELECT MAX(author_fname), MIN(author_fname) FROM books; 
SELECT MIN(author_lname) FROM books;

# Subqueries

SELECT title, pages 
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

select title, released_year FROM books WHERE released_year = (SELECT MAX(released_year) FROM books);-- newest book
select title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);-- oldest book

/*MORE ON GROUP BY ------------------------------------------------------------------------------------------------------------------*/

# WAY 1st
SELECT author_lname, author_fname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;
-- grouping by two columns
-- results according both columns at once

# WAY 2nd
SELECT CONCAT(author_fname, ' ', author_lname)
AS author, COUNT(*)
FROM books
GROUP BY author; 

/* MIN AND MAX WITH GROUP BY AGGREGATE FUNCTION*/

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS books,
    MIN(title) AS first_book,
    MIN(released_year) AS first_released_year,
    MAX(pages) AS longest_book
FROM
    books
GROUP BY author

/*SUM -just simple addition -----------------------------------------------------------------------------*/

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

SELECT author_lname, SUM(released_year) FROM books GROUP BY author_lname;

SELECT SUM(author_fname) FROM books; -- 0 
-- no number then no sum just retrun 0 

/*AVG -------------------------------------------------------------------------------------------------*/

SELECT AVG(pages) FROM books; -- 368.0526 - avg

SELECT AVG(stock_quantity) FROM books;  -- 132.8947 - avg

SELECT STD(stock_quantity) FROM books


