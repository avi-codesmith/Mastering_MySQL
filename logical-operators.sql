/*Logical operator */

-- NOT EQUAL
SELECT * FROM books WHERE released_year != "2014";
SELECT title, author_lname FROM books WHERE author_lname != "gaiman";

-- NOT LIKE
SELECT title FROM books WHERE title NOT LIKE "% %";
SELECT title, author_fname FROM books WHERE author_fname  NOT LIKE "da%";
SELECT title FROM books WHERE title NOT LIKE "%i%";

-- greater than, lesser than >,<,<=,>= 
SELECT released_year AS "20th century's books" FROM books WHERE released_year >= 2000;
SELECT released_year AS "19th century's books" FROM books WHERE released_year < 2000;
SELECT title, pages AS 'short books' FROM books WHERE pages <= "200";
SELECT title, pages AS 'long books' FROM books WHERE pages > "200";

-- AND operator
SELECT title AS 'Written by dave', released_year, author_fname
FROM books
WHERE author_fname = 'dave'
AND title LIKE "%novel%"
AND released_year > 2010;
SELECT title, pages, author_fname FROM books WHERE CHAR_LENGTH(title) > 30 AND pages > 500;


-- OR operator

SELECT title,pages,  author_fname FROM books WHERE (author_fname = "neil" OR author_fname = "dave") AND pages < 300; 

-- BETWEEN operator 
-- Mannual between 
SELECT title, pages, released_year FROM books WHERE (released_year >= 1950 AND released_year < 2000) AND pages < 300;
-- BETWEEN OPERATOR 
SELECT title, pages, released_year FROM books WHERE (released_year BETWEEN 1950 AND 2000) AND pages < 300;
SELECT title, pages FROM books WHERE pages BETWEEN 208 AND 300;
-- NOT BETWEEN OPERATOR
SELECT title, pages FROM books WHERE pages NOT BETWEEN 300 AND 465;

