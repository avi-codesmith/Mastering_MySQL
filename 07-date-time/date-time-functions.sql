/*DATE AND TIME FUNCTIONS ------------------------------------------------------------------------------------------------------*/ 

-- CURRENT_DATE() - current date
-- CURRENT_TIME() - current time
-- CURRENT_TIMESTAMP() - current datetime

INSERT INTO people(name, birthDate, birthTime, birthDT)
VALUES('Hrayuz', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

/*DATE SPECIFIC FUNCTIONS --------------------------------------------------------------------------------------------------------------*/

-- DAYOFMONTH(...) OR DAY(...) - return day of the month (1-31)
-- DAYOFWEEK(...) - return day of week (1-7) starts from sunday-1
-- DAYOFYEAR(...) - return day of year (1-365)

-- WEEK(...) -return weak of year in numbers
-- YEAR(...) - return year like 2026, 2000
-- MONTH(..) - return month like 6, 12, 1 

-- MONTHNAME(...) - return name of month
-- DAYNAME(...) - return name of day 

SELECT name, birthDate, DAY(birthDate), DAYOFWEEK(birthDate), YEAR(birthDate) FROM people;
SELECT MONTHNAME(birthDate) FROM people;
SELECT DAYNAME(birthDate) FROM people;

/*something crazy*/

SELECT MONTHNAME(birthTime) FROM people; -- sql just guessing the current month to all
SELECT YEAR(birthTime) FROM people; -- sql just guessing the current year to all
-- but no errors!

SELECT DAYOFYEAR(birthDT) FROM people; -- return actual year bcz it has access 
SELECT MONTHNAME(birthDT) FROM people; -- return actual month bcz it has access 

/*TIME SPECIFIC FUNCTIONS --------------------------------------------------------------------------------------------------------------*/

-- HOUR 
-- MINUTE
-- SECOND

SElECT  birthTime, HOUR(birthTime)  FROM people;
SElECT  birthDate, HOUR(birthDate)  FROM people; -- return 0 no errors :D

SElECT  birthTime, MINUTE(birthTime)  FROM people;
SElECT  birthDate, MINUTE(birthDate)  FROM people; -- return 0 no errors :D

SElECT  birthTime, SECOND(birthDT)  FROM people; -- also have access to time
SElECT  birthDate, SECOND(birthDate)  FROM people; -- return 0 no errors :D

-- some more 

-- DATE(...) - give date 
-- TIME(...) - give time 

SELECT DATE(birthDT) FROM people;
SELECT DATE(birthTime) FROM people; -- give current mysql just guessing

SELECT TIME(birthDT) FROM people;
SELECT TIME(birthDate) FROM people; -- give 00:00:00