create table Customers(
	CustomerId int primary key,
	CustomerName nvarchar(50),
	ContactName nvarchar(50),
	Address nvarchar(50),
	City nvarchar(50),
	PostalCode nvarchar(50),
	Country nvarchar(50)
)
go

insert into Customers values(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany')
insert into Customers values(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico')
insert into Customers values(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico')
insert into Customers values(4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP	','UK')
insert into Customers values(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','	S-958 22','Sweden')

--select
select * from Customers;
select Country from Customers;

--select distinct
select distinct Country from Customers;

--select top
select * from Customers;
select top 2 * from Customers where Country = 'Mexico';
select top 2 ContactName from Customers order by ContactName desc;



--------------------------------------------------------------------
-- create Products table
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

--select min
select * from Products;
select min(Price) from Products;

--select max
select max(Price) from Products;

--count
select * from Products;
select count(*) from Products where Price > 20;

--average
select avg(Price) from Products;

--sum
select sum(Price) from Products;

--aliases
select count(*) as TotalProduct from Products where Price > 20;
select avg(Price) as AveragePrice from Products;
select sum(Price) as SumPrice from Products;
select ProductId as Id from Products;

--union operator de noi 2 or nhieu ket qua lai voi nhau
--select union
create table Products1
(
	ProductId int primary key,
	ProductName nvarchar(50),
	SupplierId int,
	CategoryId int,
	Unit nvarchar(50),
	Price decimal
)
go

insert into Products1 values(1,'Chais',1,1,'10 boxes x 20 bags',18);
insert into Products1 values(2,'Chang',1,1,'24 - 12 oz bottles',19);
insert into Products1 values(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10);
insert into Products1 values(4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22);
insert into Products1 values(5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.25);
insert into Products1 values(6,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.25);
insert into Products1 values(7,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.25);
--tu loai bo di nhung row giong nhau
select * from Products
union
select * from Products1;
--lay het
select * from Products
union all
select * from Products1;

--isnull -> kiem tra gia tri null va dua ra gia tri thay the
select * from Products1;
update Products1 set Unit = null where ProductId=3;
select ProductId, isnull(Unit, 'No unit') from Products1;

--select into->copy du lieu ra 1 bang moi
select * into Product2
from Products where Price > 20;
