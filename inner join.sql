drop table Products

create table Products
(
	ProductId int primary key,
	ProductName nvarchar(50),
	SupplierId int,
	CategoryId int,
	Unit nvarchar(50),
	Price decimal
)
go
insert into Products values(1,'Chais',1,1,'10 boxes x 20 bags',18);
insert into Products values(2,'Chang',1,1,'24 - 12 oz bottles',19);
insert into Products values(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10);
insert into Products values(4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22);
insert into Products values(5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.25);
insert into Products values(6,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.25);
--tao bang Categories
create table Categories
(
	Id int primary key,
	Name nvarchar(50)
)
insert into Categories values(1,'Kitchen');
insert into Categories values(2,'Living Room');
--tao bang Supplier
delete from Supplier where Id = 1;
drop table Supplier;
create table Supplier(
	Id int,
	Name nvarchar(50),
	Country nvarchar(50)
)
insert into Supplier values(1,'Suplier 1','Germany')
insert into Supplier values(2,'Suplier 2','France');

--inner join query
select p.ProductId, p.ProductName, s.Name as SupplierName, c.Name as CategoryName, p.Unit, p.Price 
from Products p inner join Categories c
on p.CategoryId = c.Id
inner join Supplier s
on p.SupplierId = s.Id;