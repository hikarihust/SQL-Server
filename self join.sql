drop table Customers;

create table Customers
(
	CustomerID int,
	CustomerName nvarchar(50),
	ContactNAme nvarchar(50),
	Address nvarchar(50),
	City nvarchar(50),
	PostalCode nvarchar(20),
	Country nvarchar(20)
)
insert into Customers values(1, 'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany');
insert into Customers values(2,	'Ana Trujillo Emparedados y helados	Ana Trujillo','Avda. de la Constitución', '2222','México D.F.','05021','Mexico');
insert into Customers values(3,	'Antonio Moreno Taquería','Antonio Moreno	Mataderos', '2312','México D.F.','05023','Mexico');

--self join - lay ra danh sach cac khach hang cung thanh pho
select c1.CustomerName as CustomerName
from Customers c1 inner join Customers c2
on c1.City = c2.City 
where c1.CustomerID <> c2.CustomerID
order by CustomerName;