drop table Person;

create table Person(
	PersonId int primary key,
	IdentityNo varchar(20) not null,
	Name nvarchar(50)
);
insert Person values(1, null, 'Nguyen Van A');
insert Person values(2, '234', 'Nguyen Van A');

--tao dang buoc not null bang cach sua bang/sua cot
drop table Person;
create table Person(
	PersonId int primary key,
	IdentityNo varchar(20),
	Name nvarchar(50)
);
alter table Person
alter column IdentityNo varchar(20) not null
