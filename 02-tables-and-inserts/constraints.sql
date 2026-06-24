/*CONSTRAINTS - LIMITATION PROVIDER KEYWORDS*/

/*UNIQUE CONSTRAINT*/

CREATE TABLE contacts(
  name VARCHAR(50),
  number INT UNIQUE -- number can't be same. it is unique
);

DESC contacts;

INSERT INTO contacts(name, number) VALUES("Hobort", 0390239203),("Haward", 0390239203);
-- throw error (same number)

/*CHECK CONSTRAINT*/

CREATE TABLE partiers(
  name VARCHAR(50),
  age INT CHECK (AGE > 18)
);

INSERT INTO partiers(name, age) values("Sarmantino", 40);
INSERT INTO partiers(name, age) values("Bruno", 18); 
-- throw error (only 18+ allowed) (bye! :( bruno)

SELECT * FROM partiers;

CREATE TABLE palindromes(
   id INT PRIMARY KEY AUTO_INCREMENT,
   word VARCHAR(100) CHECK(REVERSE(word) = word) 
   -- if it violated then it is named as palindromes_chk_1, you will named constraints from line 41
);

INSERT INTO palindromes(word) VALUES("war=raw"); -- it is a palindrome ADDED INTO TABLE :)
INSERT INTO palindromes(word) VALUES("racecar"); -- it is a palindrome ADDED INTO TABLE :)
INSERT INTO palindromes(word) VALUES("WCW"); -- it is a palindrome ADDED INTO TABLE :)


SELECT * FROM palindromes;

/*NAMED CONSTRAINTS*/

CREATE TABLE `rubik's cube` (
  name VARCHAR(100),
  age INT,
  CONSTRAINT min_toy_age CHECK (age > 3)
  -- violated and named as  min_toy_age (as we given)
  -- improoves readability
);

INSERT INTO `rubik's cube`(name, age) VALUES("BrownRowan", 3) -- age ain't > 3






