use HUST

--create table
CREATE TABLE Student
(
	Id INT,
	[Name] NVARCHAR(50),
	[Age] INT,
	DateOfBirth DATE,
	Gender BIT
)

--drop table
DROP TABLE Student;

--insert data to table
INSERT INTO Student(Id,	Name, Age, DateOfBirth, Gender) VALUES(1, 'Nguyen Van A', 20, '1990-02-12', 1);
INSERT INTO Student(Id,	Name, Age, DateOfBirth, Gender) VALUES(2, 'Nguyen Van B', 21, '1991-02-14', 1);
INSERT INTO Student(Id,	Name, Age, DateOfBirth, Gender) VALUES(3, 'Nguyen Van C', 24, '1990-12-12', 1);

SELECT * From Student1;

--delete table
DELETE FROM Student WHERE Age > 21;

DELETE FROM Student;

TRUNCATE TABLE Student;

--Rename table
sp_rename 'Student1', 'Student';

--coppy du lieu tu bang nguon sang bang dich
SELECT * INTO Student1 FROM Student;

SELECT Id, name INTO Student2 FROM Student1;

--copy du lieu vao trong 1 bang da ton tai
--SELECT * From Student;
--TRUNCATE TABLE Student1;
--Select * FROM Student1;
INSERT INTO Student1
SELECT * FROM Student