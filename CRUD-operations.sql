/*CRUD - CREATE READ UPDATE DELETE*/

-- CREATE-----------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE cats(
--   cat_id  INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(100),
--   breed VARCHAR(100),
--   age INT
-- );

-- INSERT INTO cats(name, breed, age)
-- VALUES
--     ('Ringo', 'Tabby', 4),
--     ('Cindy', 'Maine Coon', 10),
--     ('Dumbledore', 'Maine Coon', 11),
--     ('Egg', 'Persian', 4),
--     ('Misty', 'Tabby', 13),
--     ('George Michael', 'Ragdoll', 9),
--     ('Jackson', 'Sphynx', 7);

-- READ OR RETRIEVE-------------------------------------------------------------------------------------------------------------------

-- SELECT * FROM cats; -READ ALL COLUMNS
-- SELECT name,age FROM cats; -READ SPECIFIC COLUMNS
-- SELECT * FROM cats WHERE age = 4; - READ ALL COLUMNS CONDIONALLY 
-- SELECT age,name FROM cats WHERE age = 4; -READ SPECIFIC COLUMNS CONDITIONALLY
-- SELECT age FROM cats WHERE breed = '🗿'; -FIND VALUE IF KNOW ONE VALUE 
-- SELECT * FROM cats WHERE name="eGg" -READ INFORMATION ABOUT A SPECIFIC ROW, IN THIS THE CASE OF FIELD DOES'NT MATTER
-- WHERE fetch first then SELECT give data, So, SELECT is totally independent, If we know onevalue (name) then we can find othervalue (age) ...as I did in line no.28 

/*Practise time*/
-- done in CML

/*ALIAS AS*/

-- SELECT name AS catName,age AS catAge FROM cats WHERE age >= 4;

-- UPDATE - the values--------------------------------------------------------------------------------------------------------------------------------------

-- UPDATE cats SET age=5 WHERE cat_id=1; -- with WHERE conditionally
-- UPDATE cow SET age= "winking_cow"; -- update all the values in one field (not to do)
-- UPDATE cats SET age="5", name="fify" WHERE age = 4;  -- contionally update 2 different values of different fields
-- UPDATE cow SET  age=12, name="hellus"; update all the values of different fields (not to do)


/*Lets do some practise*/

-- UPDATE cats SET age = 12 WHERE cat_id > 1 AND cat_id < 4 ;
-- SELECT * from cats;

-- DELETE OR DESTROY--------------------------------------------------------------------------------------------------------------------------------

/* FIRST SELECT THAT TO BE DELETE DATA*/

-- DELETE FROM cats WHERE cat_id = 4; 
-- SELECT * FROM cats;
-- DELETE FROM cow; /*Don't do that*/


/*TIME TO PRACTISE*/

-- DELETE FROM cats;  