/*ALTER TABLE*/

ALTER TABLE users
ADD COLUMN mobile_number INT NOT NULL DEFAULT 0; -- add column

ALTER TABLE users 
DROP COLUMN mobile_number; -- drop column

ALTER TABLE users RENAME TO consumers; -- rename table
RENAME TABLE consumers TO users; -- rename table (shoter way)

ALTER TABLE users
RENAME COLUMN name TO myname; -- rename column
ALTER TABLE users 
RENAME COLUMN myname TO name; -- rename column practise

ALTER TABLE users MODIFY name VARCHAR(300) DEFAULT "UN_NAMED" NOT NULL; -- modify columns
ALTER TABLE users MODIFY name VARCHAR(100); -- modify column practise
DESC users;

ALTER TABLE users 
CHANGE name myname VARCHAR(200); -- rename + modify = change

ALTER TABLE users
ADD CONSTRAINT namecheck CHECK (CHAR_LENGTH(myname) >= 3); -- add constraint

ALTER TABLE users
DROP CONSTRAINT namecheck; 

INSERT INTO users(myname, myaddress) VALUES("ABcd", "102, R.R. lane, arramino");

SELECT * FROM users;

