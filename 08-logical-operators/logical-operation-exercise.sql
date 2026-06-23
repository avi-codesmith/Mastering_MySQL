/*LOGICAL OPERATION EXERCISE*/

-- 0
-- 1
-- 1
SELECT title, released_year FROM books WHERE released_year < 1980; -- CanneryRow 1945 

SELECT title, author_lname FROM books WHERE author_lname = "eggers" OR author_lname = "chabon"; -- 4 results

SELECT title, author_lname, released_year FROM books 
WHERE author_lname = "lahiri" AND released_year > 2000; -- TheNamesake

SELECT title, author_lname FROM books WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S'); -- 8 results

SELECT title, author_lname, 
CASE 
 WHEN title LIKE "%stories%" THEN "Short Stories"
 WHEN title LIKE "just kids" OR title LIKE "a heartbreaking work%" THEN "Memoir"
ELSE "Novel"
END AS TYPE
FROM books; -- DONE

SELECT CONCAT(author_fname, " " ,author_lname) AS Author,
CONCAT(COUNT(*), " " ,(CASE WHEN COUNT(*) <= 1 THEN "book" ELSE "books" END)) AS COUNT
FROM books
GROUP BY Author
ORDER BY COUNT(*) DESC, Author; -- DONE 


