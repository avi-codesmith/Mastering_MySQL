/*VIEWS - store queries (a virtual table)----------------------------------------------------------------------------------------------------*/

-- Typing all the time become a chore

SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    Reviews
        JOIN
    Series ON Series.id = Reviews.Series_id
        JOIN
    Reviewers ON Reviewers.id = Reviews.Reviewer_id;
    
-- Make a view instead

CREATE VIEW full_reviews AS 
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
  Reviews
JOIN Reviewers ON Reviewers.id = Reviews.reviewer_id
JOIN Series ON Series.id = Reviews.series_id;
    
-- we can use them easily
SELECT * FROM full_reviews WHERE genre = "animation";

SHOW TABLES;
DESC full_reviews;
-- we can found our virtual table

/*We can update views!!! (like a table )--------------------------------------------------------------------------------------------------------------------------------------------------*/ 
-- there are only some views that are updatable, insertable, deletable.

DELETE FROM full_reviews WHERE released_year = 2010; -- won't work 
-- bcz it contain complex joins

-- make a updatable view:
CREATE VIEW orderes_series AS 
SELECT * FROM Series ORDER BY released_year;

-- can be update
DESC orderes_series;

INSERT INTO orderes_series(title, released_year, genre) VALUES("Acknowledge me!", 2025, "Animation");
-- worked!!!

DELETE FROM ordered_series WHERE title = "Acknowledge me!";
-- worked!! ☝️roman gone!! 🤜👊🤛

SELECT * FROM ordered_series;

/*ALTERING/REPLACING VIEWS ----------------------------------------------------------------------------------------------------------------------------*/

-- I want a DESC order in ordered_series then:
CREATE VIEW ordered_series AS
SELECT * FROM Series ORDER BY released_year DESC; -- wont work already exists

-- Then we would do:
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM Series ORDER BY released_year DESC; -- it will create or if exist then replace
-- it will work!!

-- one more option
ALTER VIEW ordered_series AS 
SELECT * FROM Series ORDER BY released_year; -- back to initial
-- also work fine!!

ALTER TABLE orderes_series
RENAME TO ordered_series; -- won't work

RENAME TABLE orderes_series TO ordered_series;
-- will work


DROP VIEW ordered_series; -- DROP ordereD_series
SELECT * FROM Series; -- BUT DATA IS STILL IN THE TABLE
-- ONLY VIEW IS DELETED!

/*SHORT SUMMARY--------------------------------------------------------------------------------------------------------------*/

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year; -- CREATE VIEW
 
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC; -- CREATE OR REPLACE VIEW
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year; -- ALTER VIEW
 
DROP VIEW ordered_series; -- DROP VIEW