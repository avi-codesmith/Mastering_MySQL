/* HAVING clause with group by */
-- It is a clause by which we can set conditions over aggregate functions typically formed by GROUP BY clause.

SELECT genre, MIN(released_year) FROM Series WHERE MIN(released_year) > 2005 GROUP BY genre;
-- WON'T WORK
-- RULE OF THUMB - WHERE execute first!!
-- WHERE is executed before GROUP BY and SELECT, so at that point AVG(released_year) has not been calculated yet.

-- SOLUTION:
SELECT genre, MIN(released_year) FROM Series GROUP BY genre HAVING MIN(released_year) > 2005; -- WILL WORK

-- EXECUTION TABLE
/*
FROM
   ↓
WHERE
   ↓
GROUP BY
   ↓
HAVING
   ↓
SELECT
   ↓
ORDER BY
   ↓
LIMIT
*/

/*ROLL UP WITH GROUP BY*/
-- It is a summary for entire table.
-- Used with GROUP BY and aggregate functions.
-- Give summary according to aggregate function.

SELECT title, COUNT(rating) FROM full_reviews GROUP BY title WITH ROLLUP; -- give count with new column 
SELECT title, MAX(rating) FROM full_reviews GROUP BY title WITH ROLLUP; -- give max rating with new column

SELECT title, first_name, MAX(rating) FROM full_reviews GROUP BY title, first_name WITH ROLLUP;
--  give max rating with new column for each title and at the end  give max rating with new column overall of title.

