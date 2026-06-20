/*COMPLEX DATA TYPES*/

/*CHAR AND VARCHAR -----------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE employees_table (name VARCHAR(10));
DESC employees_table;
INSERT INTO employees_table(name) VALUES('pppppp');
SELECT * FROM employees_table;

CREATE TABLE friends (name CHAR(10));
DESC friends;
INSERT INTO friends(name) VALUES('pppppp');
SELECT * FROM friends;

-- results VARCHAR AND CHAR result same but:
-- if we add lesse characters in CHAR column then:
-- behind the scenes: CHAR include white space to fulfill the demanded amount
-- It results same though but takes more space

/*
CHAR(4) vs VARCHAR(4)

Value      | CHAR(4) Stored | Storage | VARCHAR(4) Stored | Storage
-----------|----------------|---------|-------------------|--------
''         | '    '         | 4 bytes | ''                | 1 byte
'ab'       | 'ab  '         | 4 bytes | 'ab'              | 3 bytes
'abcd'     | 'abcd'         | 4 bytes | 'abcd'            | 5 bytes

Notes:
- CHAR(4) is fixed-length and always uses 4 bytes.
- CHAR pads unused space with trailing spaces.
- VARCHAR(4) is variable-length.
- VARCHAR uses actual data length + 1 byte to store length information.
*/

/*ALL ABOUT INT ---------------------------------------------------------------------------------------------------------------*/

-- TINYINT 
-- SMALLINT 
-- MEDIUMINT
-- INT 
-- BIGINT

# SIGNED AND UNSIGNED

-- unsigned = without (-) only positive
-- signed = with (-) either + or -

CREATE TABLE parents(children INT UNSIGNED); -- by default it is SIGNED with - and + 
-- children can't be negative - UNSIGNED would be best here :)
INSERT INTO parents(children) values(222); -- ok! :)
INSERT INTO parents(children) values(-222); -- !ok +_-' error -_-'

# DECIMALS----------------------------------------------------------------------------------------------------------------------------------------------

-- DECIMAL(5,2) upto 5 total digits, add point after two digit backwards

CREATE table products(price DECIMAL(10, 2));

INSERT INTO products(price) VALUES(10.55); -- 10.55
INSERT INTO products(price) VALUES(1044); -- 1044.00
INSERT INTO products(price) VALUES('ddddddd'); -- error string
INSERT INTO products(price) VALUES(111.2222); -- 111.22 only two char after ".", with warning result is 111.22 - value will truncate
INSERT INTO products(price) VALUES(11111122222222222222.11); -- error out of range! 
 

SELECT * FROM products;
/*
-- FLOAT AND DOUBLE -----------------------------------------------------------------------------------------------------------------------------------------
- FLOAT: memory 4bytes, upto 7 digits
- DOUBLE: memory 8bytes, upto 15 digits
*/

CREATE TABLE laptop(memory DOUBLE, rating FLOAT);

INSERT INTO laptop(memory, rating) VALUES(395.34, 4.5); -- work fine:D
INSERT INTO laptop(memory, rating) VALUES(345.455565567, 4.5555555);
--                                        fine, will turncate roundoff (float have upto 7 digit allowed)
INSERT INTO laptop(memory, rating) VALUES(345.45556556733333333, 4.5555555);
--                                        both will turncate roundoff (float and double only habe 7 and 15 digits allowed)

SELECT * FROM laptop;

DESC laptop;

# Rule of Thumb 🎯

-- salary DECIMAL(10,2)   -- ₹50000.75
-- pi DOUBLE              -- 3.141592653589793
-- temperature FLOAT      -- 36.7

/*DATE, TIME AND DATETIME at the same time ---------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE people(
    name VARCHAR(100),
    birthDate DATE,
    birthTime TIME,
    birthDT DATETIME
);

DESC people;

INSERT INTO people(name, birthDate, birthTime, birthDT) 
VALUES
("Alborto", "1910-8-12", "12:20:02", "1910-12-12 13:09:59"), 
("Milton", "1990-2-16", "23:20:0", "1990-2-16 23:20:0"),
("Wraxen", "2000-10-12", "8:28:45", "2000-10-12 8:28:45");

SELECT * FROM people;