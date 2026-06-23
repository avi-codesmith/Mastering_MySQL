-- Comparing dates

SELECT name, birthDate FROM people WHERE birthDate > "1910-10-10";
SELECT name, birthDate FROM people WHERE YEAR(birthDate) > 2000;
SELECT name, birthTime FROM people WHERE HOUR(birthTime) < 9;

-- IN KEYWORD

-- mannualy 
SELECT title, author_fname FROM books
WHERE author_fname = "jhumpa" 
OR author_fname = "dan" 
OR author_fname = "dave"; -- become a chore

-- IN (easy way)
SELECT title, author_fname FROM books WHERE author_fname IN ("jhumpa", "dan", "dave");

-- NOT IN KEYWORD 
SELECT title, author_fname FROM books WHERE author_fname NOT IN ("jhumpa", "dan", "dave");

-- MODULO %
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

-- CASE STATEMENTS
SELECT title, released_year,
CASE
WHEN released_year < 2000 THEN "20th century books"  
ELSE "modern books"
END AS GENERE
FROM books;

SELECT title, stock_quantity,
CASE 
  WHEN stock_quantity <= 50  THEN "⭐"
  WHEN stock_quantity <= 100  THEN "⭐⭐"
  WHEN stock_quantity <= 200  THEN "⭐⭐⭐"
  WHEN stock_quantity <= 300  THEN "⭐⭐⭐⭐"
ELSE "⭐⭐⭐⭐⭐" 
END AS GENERE
FROM books
ORDER BY stock_quantity DESC;

-- IS NULL
SELECT * FROM books WHERE author_fname IS NULL;
DELETE FROM books WHERE author_fname IS NULL;
-- IS NOT NULL
SELECT * FROM books WHERE author_fname IS NOT NULL;




