/*Refining selections*/
-- DISTINCT
-- ORDER BY
-- LIMIT
-- LIKE


INSERT INTO 
   books
   (title, author_fname, author_lname, released_year, stock_quantity, pages)
   VALUES
   ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
   ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
   ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
   ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
   ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
   ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
   ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
   ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
   ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
   ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
   ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 98, 546),
   ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526), 
   ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
   ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
   ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
   ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

/*DISTINCT KEYWORD ------------------------------------------------------------------------------------------------------------------*/

SELECT DISTINCT author_lname from books;

SELECT DISTINCT released_year from books;  

SELECT DISTINCT CONCAT(author_fname, " ", author_lname) FROM books; 
SELECT DISTINCT author_fname, author_lname FROM books;
-- 39. It doesn't mean that it select the distinct author F name and then the author L name. It's just combining the author F name and author L name.

/* ORDER BY - sort (important) KEYWORD ----------------------------------------------------------------------------------------------------------------------*/

# DESC = DESCRIBE YEAH RIGHT BUT
# DESC = DESCENDING TOO!

SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT title, pages FROM books ORDER BY released_year;
-- we can even do this :D

# easy syntax :-)
#              2 ←←←←←←←←←←←←←←←←←←←←←← ↓
#             _↓_                      _↓_
SELECT title, pages FROM books ORDER BY 2;
-- what 2 = 2nd column which is "pages"

SELECT author_fname, released_year, title FROM books ORDER BY 1 DESC, 2 DESC;
-- We can add ASC or DESC accordingly
SELECT author_fname, released_year, title FROM books ORDER BY 1, 2 DESC; -- latest book

SELECT CONCAT(author_fname, " ", author_lname) AS author_name FROM books ORDER BY 1;

/* LIMIT KEYWORD - ROWS ----------------------------------------------------------------------------------------*/
-- limit - two values - execpt_value, give_result_value
-- LIMIT 1,5 - mean = except first row give next five ones
-- Both values ain't mendatory.

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5; -- can be used as this, five results/rows
# ===
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5; -- left zero row, five results/rows

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 2,2; -- left two rows, two rows

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 2,0; -- left two rows, zero rows

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 18, 22222222;
-- left 18 rows, 22222222 rows 
-- but we have only 2 left :(
-- not a problem :)
-- it will print only 2
-- noo errors! :D

/*LIKE KEYWORD - SEARCH */

-- LIKE - smart search, most likely search
-- case free, no matter upper or lower
-- % = zero or more characters

SELECT DISTINCT author_fname FROM books WHERE author_fname LIKE '%dAv%'; -- retrun David

SELECT author_fname FROM books WHERE author_fname LIKE '%DA%'; -- Dave, David..., Freida
-- just any where da the the row prints...as in line no.93

SELECT author_fname FROM books WHERE author_fname LIKE "Da%"; -- Dave, David..., 
-- no Freida (here, words are before da)
-- David, Dan... (here, words are after da) as we said da%

SELECT author_fname FROM books WHERE author_fname LIKE "%dA"; -- Freida
-- no David, Dan... this time (here words after da)
-- Freida its here (here words before da) as we said %DA
