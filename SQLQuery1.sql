CREATE TABLE Students
(
Student_ID INT PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
Adress_ID INT UNIQUE,
Class_ID VARCHAR(3)
);

CREATE TABLE Classes
(
Class_ID VARCHAR(3) PRIMARY KEY,
Class_Name VARCHAR(20)
);

CREATE TABLE Adress
(
Adress_ID INT PRIMARY KEY,
City VARCHAR(20),
Adress VARCHAR(50),
Student_ID INT UNIQUE REFERENCES Students(Student_ID) 
);

CREATE TABLE Teachers
(
Teacher_ID INT PRIMARY KEY,
Name VARCHAR(20),
Sex VARCHAR(1) NOT NULL
);

CREATE TABLE TeacherClassRelation
(
Teacher_ID INT NOT NULL,
Class_ID VARCHAR(3) NOT NULL,

FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID),
FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID),
UNIQUE (Teacher_ID, Class_ID)
);

ALTER TABLE Teachers
ADD MOD_Date DATETIME ;

UPDATE Teachers
SET MOD_Date = CURRENT_TIMESTAMP
WHERE ....;

DROP TABLE Students;

INSERT INTO TeacherClassRelation VALUES (5, '12B', 'Politica');

--Group students by their class

SELECT Class_ID, COUNT(Student_ID) AS Students
FROM Students
GROUP BY Class_ID
ORDER BY Class_ID;

--See all the students from 12B

SELECT Students.Name,Classes.Class_ID
FROM Students
JOIN Classes
ON Classes.Class_ID=Students.Class_ID AND Students.Class_ID='12B';

--See how many teachers are male

SELECT COUNT(Teachers.Teacher_ID) AS Teachers, Teachers.Sex
FROM Teachers
GROUP BY Teachers.Sex
HAVING sex='M';

SELECT * FROM Students;

CREATE INDEX Materie
ON TeacherClassRelation(Preda);



