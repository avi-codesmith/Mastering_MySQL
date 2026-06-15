/*TIME TO PRACTISE A BIT*/

SELECT(UCASE(REVERSE("Why does my cat look at me with such hatred?")));

SELECT REPLACE(title, " ",  "->") from books;

SELECT author_fname AS Forwards, REVERSE(author_lname) AS Backwards FROM books; 

SELECT CONCAT( UCASE(author_fname)," ", UCASE(author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(LEFT(title ,13), " was released in ", released_year, ".") AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS "character count" FROM books;

SELECT 
    CONCAT(LEFT(title, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books
;



