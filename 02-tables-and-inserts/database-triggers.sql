/*DATABASE TRIGGERS*/

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON partiers FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

INSERT INTO partiers(name, age) VALUES("De Parodi", 19);
INSERT INTO partiers(name, age) VALUES("De Parodi", 19);

DESC users;

SELECT * FROM partiers;

ALTER TABLE follows 
ADD PRIMARY KEY (follower_id, followee_id);

ALTER TABLE follows
DROP CONSTRAINT follows_chk_1;

SHOW INDEX FROM follows;

INSERT INTO follows(follower_id, followee_id) values(1, 1);

/**/