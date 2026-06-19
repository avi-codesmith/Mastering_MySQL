/*TIME TO PRACTISE*/

SELECT COUNT(*) FROM books; -- 21

SELECT released_year, count(*) FROM books GROUP BY released_year; -- 2003 2... 

SELECT SUM(stock_quantity) FROM books; -- 2525

SELECT CONCAT(author_fname, " ", author_lname) AS author, AVG(released_year) FROM books GROUP BY author;

SELECT CONCAT(author_fname, " ", author_lname) AS author, title, pages 
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT  released_year AS year, count(*) AS '# book', AVG(pages) AS 'Avg pages' FROM books GROUP BY released_year ORDER BY released_year;

