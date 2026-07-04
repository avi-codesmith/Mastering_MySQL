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

INSERT INTO follows(follower_id, followee_id) values(1, 1); -- prevent this now!

/*TIGGERING SELF JOIN*/

DELIMITER $$

   CREATE TRIGGER self_follow
     BEFORE INSERT ON follows FOR EACH ROW 
     BEGIN
       IF NEW.follower_id = NEW.followee_id
       THEN 
         SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Self follow not allowed";
       END IF;     
	 END;
$$
DELIMITER ;

INSERT INTO follows(follower_id, followee_id) values(1, 1); -- can't do

CREATE TABLE unfollows(
  follower_id INT,
  followee_id INT,
  CHECK (follower_id != followee_id),
  unfollow_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (follower_id, followee_id)
);


/*HANDLING UNFOLLOW DATA*/

DELIMITER $$

   CREATE TRIGGER unfollows_data
   AFTER DELETE ON follows FOR EACH ROW
    BEGIN 
	   INSERT INTO unfollows(follower_id, followee_id) 
       VALUES(OLD.follower_id, OLD.followee_id);
    END;
   $$ 
DELIMITER ;

DELETE FROM follows WHERE followee_id = 2 ORDER BY follower_id LIMIT 2;
 -- data inserted!!
SELECT * FROM unfollows;

