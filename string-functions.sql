/*String functions*/

-- Can be used along with :-);

CREATE DATABASE book_shop;
USE book_shop;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

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

/*CONCAT - COMBINING COLUMNS (vertical one ||)*/

-- SELECT CONCAT(author_fname, ' ', author_lname) AS author_fullname FROM books;
   SELECT CONCAT_WS('-', title, author_fname, author_lname ) AS URL FROM books;
-- SELECT * FROM books; 

/*SUBSTRING - GET A PART OF STRING (COLUMN OF A TABLE USUALLY - STRING)*/

-- SELECT SUBSTRING("string or string column", starting_point, ending_point (counts from the starting point));
SELECT SUBSTRING("HELLO WORLD", 2, 4);
SELECT SUBSTRING("HELLO WORLD", 7); -- starts from seven end when words end but still works :D
SELECT SUBSTRING("HELLO WORLD", -1, 2); -- negative value starts backwords

/*REAL WORLD USAGE*/
-- SUBSTRING === SUBSTR (NO DIFFERNCE)
SELECT SUBSTR(author_fname, 1, 1) AS AVATAR, author_fname FROM books;

/*COMBINING BOTH THE SUBSTR AND CONCAT*/

SELECT 
    CONCAT('By', ' ', author_fname, '-') AS Author_Name,
    CONCAT(SUBSTR(title, 1, 10), '...') AS Short_Title
FROM books;
       
SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS AUTHORS
FROM
    books;

/*REPLACE - replace the part of the string :o*/

-- It is are case sensitive
-- All fields are mandetory to fill

SELECT 
    CONCAT(REPLACE(title, ' ', '-'),
            '-',
            REPLACE(author_fname, ' ', '-'),
            '-',
            author_lname) AS path
FROM
    books;
    
/*STRAIGHT FORWARD ONES*/    
    
/* REVERSE - just reverse string -_-*/

SELECT REVERSE("RAW = WAR"); /* WWE :o */
SELECT REVERSE("null"); /* results null of course*/
SELECT CONCAT(author_fname,'-', REVERSE(author_fname)) FROM books;

/*CHAR_LENGTH - tell character length wow! nice*/
/* LENGTH - tell word lenght in bytes +_+' */

SELECT CHAR_LENGTH("123456789");
SELECT CHAR_LENGTH("AVI DIXIT"); /*INCLUDE WHITE SPACE AS WELL AS BEFORE*/
SELECT CHAR_LENGTH("冰淇淋"); -- 3, just 3 letters

SELECT LENGTH("ABC"); -- 3, one letter one byte
SELECT LENGTH("冰淇淋"); -- 9, one letter 3 byte 

-- real world usage

SELECT 
    CHAR_LENGTH(title), CONCAT(SUBSTR(title, 1, 15), '...')
FROM
    books;
    
/*LOWER = LCASE AND UPPER = UCASE :D*/

SELECT LOWER("HELLO"); -- hello
SELECT UPPER('hello'); -- HELLO
SELECT UCASE("hello"); -- HELLO
SELECT LCASE("HELLO"); -- hello


    
