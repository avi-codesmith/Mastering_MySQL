/*UNIQUE KEYS - primary key*/

CREATE TABLE uniqueCats3(cat_ID INT primary key, name VARCHAR(20), age INT); -- 
INSERT INTO uniqueCats3(cat_ID, name, age) values(25, "pettiows", 1),(333, "pettieor", 2);
DESC uniqueCats3;
SELECT * FROM uniqueCats3;

drop table uniqueCats;

/*MORE ON PRIMARY KEY*/

CREATE TABLE uniqueCats(cat_Id INT NOT NULL,
 name VARCHAR(20) NOT NULL DEFAULT 'NO-NAME',
 primary key(cat_Id)
);

INSERT INTO uniqueCats(cat_Id, name) VALUES(3, "ROWANIS"),(5, "HONRSEWAGLE");
DESC uniqueCats;

DROP TABLE uniqueCats;

/*AUTO KEYS - AUTO_INCREMENT*/

CREATE TABLE uniqueCats(cat_Id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL DEFAULT 'NO-NAME',
 primary key(cat_Id)
 );

-- no need to provide ID mannualy - when we have AUTO_INCREMENT IN TABLE FOR cat_Id

INSERT INTO uniqueCats(name) VALUES("Avioatroi");
INSERT INTO uniqueCats(name) VALUES("Avioatroi");
INSERT INTO uniqueCats(name) VALUES("Avioatroi");
INSERT INTO uniqueCats(name) VALUES("Avioatroi");
INSERT INTO uniqueCats(name) VALUES("Avioatroi");
INSERT INTO uniqueCats(name) VALUES( "gaoiya");


select * from uniqueCats;

/*TABLE EXERCISE*/

create DATABASE peoples;

USE peoples;

CREATE TABLE employees(
 id INT AUTO_INCREMENT,
 firstName VARCHAR(33) NOT NULL,
 middleName VARCHAR(33),
 lastName VARCHAR(34) NOT NULL,
 age INT NOT NULL,
 current_status VARCHAR(200) NOT NULL DEFAULT "employed",
 PRIMARY KEY(id)
);

INSERT INTO employees(firstname,
 lastname, age)
			values("Aviox",
 "docisk", 15
  ), ("Aviox",
 "docisk", 15
  ),("Aviox",
 "docisk", 15
  );



