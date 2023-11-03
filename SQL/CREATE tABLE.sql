CREATE TABLE student(Sno INT,Name varchar(40),age INT,DOB date);
INSERT INTO  student(Sno,Name,age,DOB)VALUES(1,'Abishek',19,'2004-6-22');
INSERT INTO  student(Sno,Name,age,DOB)VALUES(2,'Guptha',19,'2004-5-06');
INSERT INTO  student(Sno,Name,age,DOB)VALUES(3,'Arshath',19,'2004-9-16');
INSERT INTO  student(Sno,Name,age,DOB)VALUES(4,'Shanmugam',19,'2004-6-12');
INSERT INTO  student(Sno,Name,age,DOB)VALUES(5,'rasik',19,'2004-6-22');
SELECT * FROM student

ALTER TABLE student;
ADD COLUMN student; 