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

# with DISTINCT keyword

SELECT COUNT(*) FROM books WHERE title LIKE "%the%";

/* GROUP BY - grouping -----------------------------------------------------------------------------------------------*/

SELECT author_lname, COUNT(*) AS books_written 
FROM books
GROUP BY author_lname 
ORDER BY books_written DESC;

SELECT released_year, COUNT(*) AS books_released FROM books GROUP BY released_year ORDER BY books_released DESC, 1 DESC; 

-- selection and grouping column should be same!!!!!!!

