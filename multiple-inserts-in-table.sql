/*Multiple inserts*/
-- INSERT INTO catChamber(age) value(2), (3), (4);
-- INSERT INTO catChamber(name) value("avi", "javi", "navi
-- insert INTO catChamber(name, age) value("avi", 2), ("ravi", 4), ("navi",9);
-- SELECT * FROM catChamber;
-- insert into people(age, lastname, firstname) values(2, "harry", "singh");
-- insert into people(firstname, lastname, age) values("Ben", "Cutting", 10);
INSERT INTO people(firstname, lastname, age)
            values("Sam", "Vhorcho", 10), 
				  ("Volta", "Squal", 20), 
                  ("Mouch", "Vokka", 25);
SELECT * FROM people;
