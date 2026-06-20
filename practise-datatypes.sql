/*DATA TYPES PRACTISE */

SELECT CURTIME();
SELECT CURDATE();
SELECT DAYNAME(CURDATE());

SELECT DATE_FORMAT(NOW(), "%M %D at %h:%i");

CREATE TABLE tweet(
 text VARCHAR(144),
 name VARCHAR(50),
 created_at DATETIME default CURRENT_TIMESTAMP
);

INSERT INTO tweet(text, name) VALUES("You are stupid!", "avios"), ("You are intelligent!", "aviox");

SELECT * FROM tweet;