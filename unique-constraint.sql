create table Person(
	PersonId int primary key,
	IdentityNo varchar(20) unique,
	Name nvarchar(50)
);
insert Person values(1, '123', 'Nguyen Van A');
--muon inert duoc thi IdentityNo phai khac nhau
insert Person values(2, '234', 'Nguyen Van A');

--tao unique bang cach sua bang
drop table Person;
create table Person(
	PersonId int primary key,
	IdentityNo varchar(20),
	Name nvarchar(50)
);
alter table Person
add constraint UC_PersonId unique(PersonId)