/*VIEWS - A virtual table*/

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
        JOIN
    Series ON Series.id = Reviews.Series_id;
-- Make a view instead

CREATE VIEW full_reviews AS 
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    Reviews
        JOIN
    Reviewers ON Reviewers.id = Reviews.Reviewer_id;
    
SELECT * FROM full_reviews WHERE genre = "animation";



