--them check constraint khi tao bang
CREATE TABLE Persons (    
	ID int NOT NULL,    
	LastName varchar(255) NOT NULL,    
	FirstName varchar(255),    
	Age int CHECK (Age>=18)
);
-- khong the insert duoc vi co check constraint
insert into Persons values(1, 'Nguyen', 'Van', 10);

drop table Products;
create table Products(
	Id int,
	Name nvarchar(40),
	Price decimal
);
--insert duoc binh thuong vi khong co check constraint
insert into Products values(1, 'Product A', 0);

--truoc khi them check constraint cho Price vao bang Products thi update lai gia Price da dc them vao bang
update Products set Price = 1 where Id = 1;
--them check constraint bang cach sua bang
alter table Products
add constraint CK_Price check (Price > 0);