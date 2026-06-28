/* MODES */

-- To views modes

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- To set modes

SET GLOBAL sql_mode = "modes";
SET SESSION sql_mode = "modes";


/* ERROR_FOR_DIVISION_BY_ZERO ------------------------------------------------------------------------------------*/ 

SELECT 3/0;
SHOW WARNINGS; -- warning

SET SESSION sql_mode = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION";
-- we've select only the choosen one, not choosing the ERROR_FOR_DIVISION_BY_ZERO, then 
SELECT 3/0;
SHOW WARNINGS; -- no warnings

/*STRICT_TRANS_TABLE -----------------------------------------------------------------------------------------------------------*/

-- if we disable it then we will able:
-- to insert unlinke value in table as declared with a warning
-- but when we select the table
-- we found 0 instead of inserted value!

/*ONLY_FOR_GROUP_BY*/

SELECT title, rating FROM Reviews
JOIN Series ON Reviews.series_id = Series.id
GROUP BY title; -- won't work in ONLY_FOR_GROUP_BY

SELECT title, rating FROM Reviews
JOIN Series ON Reviews.series_id = Series.id
GROUP BY title; -- will work without ONLY_FOR_GROUP_BY 
-- but return first rating for each title, not avg or max or anything... just first one!

