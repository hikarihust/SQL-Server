drop table Persons;

CREATE TABLE Persons (    
	ID int IDENTITY(1,1) PRIMARY KEY, --gia tri dau tien duoc khoi tao la 1, moi lan them 1 ban ghi thi se tang them 1
	LastName varchar(255) NOT NULL,    
	FirstName varchar(255),    
	Age int
);
insert into Persons(LastName, FirstName, Age)
values('Nguyen', 'A', 18);
select * from Persons;