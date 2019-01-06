create table Students(
	StudentId int primary key,
	Name nvarchar(50),
	Age int,
	JoinOfDate datetime
)

alter table Students
alter column Name nvarchar(50) not null  --null thi khong the lam khoa chinh duoc
alter table Students
drop constraint PK__Students__32C52B99B372CB78;

alter table Students
add constraint pk_Students_StudentId primary key(StudentId, Name);