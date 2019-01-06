create table MatchScore
(
	Player nvarchar(20),
	DepartmentId int,
	Goal int
)
insert into MatchScore values('Franklin',1,2)
insert into MatchScore values('Alan',1,3)
insert into MatchScore values('Priyanka',2,2)
insert into MatchScore values('Rajesh',3,5)

create table Departments
(
	DeparentId int,
	DepartmentName nvarchar(50)
)

insert into Departments values(1,'IT')
insert into Departments values(2,'HR')
insert into Departments values(3,'Marketing')

select * from MatchScore cross join Departments