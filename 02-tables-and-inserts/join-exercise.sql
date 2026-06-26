/*JOIN EXERCISE*/

CREATE TABLE students(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);

CREATE TABLE papers(
  title VARCHAR(100),
  grade INT,
  student_id INT,
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (name) VALUES
('Caleb'),
('Samantha'),
('Raj'),
('Carlos'),
('Lisa');

INSERT INTO papers (student_id, title, grade) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT name AS first_name, title, grade FROM students
INNER JOIN papers ON papers.student_id = students.id
ORDER BY grade DESC; 

SELECT name AS first_name, IFNULL(title, "MISSING"), IFNULL(grade, "on leave") FROM students
LEFT JOIN papers ON papers.student_id = students.id; 


SELECT name AS first_name, AVG(IFNULL(grade, 0)) AS avg_grade FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY avg_grade DESC; 

SELECT name AS first_name, AVG(IFNULL(grade, 0)) AS avg_grade, 
 CASE 
  WHEN AVG(IFNULL(grade, 0)) >= 75 THEN "PASSING"
 ELSE "FAILING"
 END as passing_result
 FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY student_id, first_name
ORDER BY avg_grade DESC;
