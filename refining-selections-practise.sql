/*REFINING SEARCH PRACTISE*/
SELECT title FROM books WHERE title LIKE "%stories%";
desc books;
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity limit 3;

SELECT 
    CONCAT(UCASE('My favorite author is '),
            CONCAT(UCASE(author_fname),
                    ' ',
                    UCASE(author_lname),
                    '!'
                    )) AS yell
FROM
    books;
