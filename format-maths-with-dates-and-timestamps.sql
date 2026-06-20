/*FORMATTING DATE and TIME*/

-- APRIL 16 2026

SELECT CONCAT_WS(" ", MONTHNAME(birthDate), DAY(birthDate), YEAR(birthDate)) from people;

/* DATE_FORMAT OR TIME_FORMAT--------------------------------------------------------------------------------------*/
-- formats date according to %x
-- "%b" - for abbreviated month like Aug, Sep,
-- "%a" - for abbreviated month like Tue, Fri,

SELECT birthDate , DATE_FORMAT(birthDate, '%a %b %D') FROM people; -- FOR DATE
SELECT birthTime , TIME_FORMAT(birthDT, 'BORN ON %h:%i %p') FROM people; -- FOR TIME

/*Maths with dates ----------------------------------------------------------------------------------------------*/

-- DATEDIFF(date1, date2)
SELECT DATEDIFF(CURDATE(), birthDate) FROM people; -- work :)
SELECT DATEDIFF(CURDATE(), birthDT) FROM people; -- work :)
SELECT DATEDIFF(CURDATE(), birthTime) FROM people; -- 0 not work :(

-- DATE_ADD(date, INTERVAL 1 MONTH)
SELECT CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 WEEK);
SELECT CURDATE(), DATE_ADD(CURDATE(), INTERVAL 20 YEAR);
SELECT CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY);

-- DATE_SUB(date, INTERVAL 1 MONTH)
SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 1.6 WEEK);
SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 16.5 YEAR);
SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 10 DAY);

/*PRACTISE TIME*/

SELECT birthDate, DATE_ADD(birthDate, INTERVAL 18 YEAR) FROM people; 

/*maths with time-------------------------------------------------------------------------------------*/

-- TIMEDIFF(time1, time2)
SELECT TIMEDIFF(CURTIME(), "9:00:00");

-- USING BASIC OPERATORS 

SELECT NOW() - INTERVAL 17 YEAR;
SELECT birthDate, CONCAT_WS(" ",MONTHNAME(birthDate + INTERVAL 12 YEAR),YEAR(birthDate + INTERVAL 12 YEAR)) AS have_access FROM people; 


-- TIMESTAMP == DATETIME()

/* TIMESTAMP vs DATETIME
--------------------------------------------------------------
| Feature | TIMESTAMP             | DATETIME             |
|---------|-----------------------|----------------------|
| Storage | 4 bytes               | 8 bytes              |
| Range   | 1970 - 2038           | 1000 - 9999          |
| Timezone| Yes (converts)        | No                   |
| Use     | created_at, updated_at| birthdays, events    |
--------------------------------------------------------------

NOTES:
- TIMESTAMP has less storage but limited range.
- DATETIME has more storage but a much larger range.
*/

/*workign with timestamp -----------------------------------------------------------------------------*/

CREATE TABLE yt_caption(
  text VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO yt_caption(text) VALUES("This is the end! hold your breath and count to ten!");

select * from yt_caption;

CREATE TABLE at_caption(
  text VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO at_caption(text) values("This laptop gonna brust macbook - Tim is cooked now! under $19XXX/-");

SELECT * FROM at_caption;

UPDATE at_caption SET text = "This laptop never gonna brust macbook - Tim ain't cooked now! price free!!!!!" WHERE text = "This laptop gonna brust macbook - Tim is cooked now! under $19XXX/-";

