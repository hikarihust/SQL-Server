/*--------------------So sanh Store Procedure va Function-----------------------*/
--Store Procedure thi co the su dung de update gia tri cua bang or cua View nhung Function chi dung de Select.

--Store procedure co the tra ve nhiu gia tri output, function chi tra ve 1 gia tri
--Co the su dung transaction trong Store Procedure, function thi ko su dung dc transaction
--Trong Store Procedure thi co the co input/output parameter, function thi chi co input parameter
--Co the goi dc function trong Store Procedure, nhung trong function thi khong the goi dc Store Procedure
--Khong the su dung gia tri tra ve cua Store Procedure trong cau Select/Where. Nhung co the su dung gia tri tra ve cua Function
   --trong cau truy van Select/Where/Having
--Co the dung Try-Catch o trong Store Procedure nhung ko the dung o trong Function 

select * from Students;

--tao function -  tra ve 1 gia tri don
create function udf_calculateAge(
	@age int --tham so truyen vao
)
returns bit  --kieu gia tri tra ve
as
begin
	declare @allowBuyTicket bit;   --khai bao bien tra ve
	if @age >=20
		set @allowBuyTicket = 1;
	else
		set @allowBuyTicket = 0;
	return @allowBuyTicket;
end

select dbo.udf_calculateAge(19);
--Su dung function trong select cua cau truy van
select *, dbo.udf_calculateAge(Age) as AllowBuyTicket from Students;
select * from (
		select *, dbo.udf_calculateAge(Age) as AllowBuyTicket from Students
	) a 
	where a.AllowBuyTicket = 1;

--Su dung function trong where cua cau truy van
select * from Students where dbo.udf_calculateAge(Age) = 1;

------------------------------------------------------------------------------

--------------------tao function -  tra ve 1 table, loai inline -> ko co begin end------------------
create function udf_StudentAgeThan(
	@age int --tham so truyen vao
)
returns TABLE
as
return(
	select * from Students where Age > @age
)	

select * from dbo.udf_StudentAgeThan(10);  --function tra ve 1 bang nen phai doi xu voi no nhu la 1 bang/dai dien cho 1 bang


-----------------------loai Multi->dinh nghia ra danh sach cot cua bang do luon-------------------------
--tao bang Customers
create table Customers(
	CustomerId int primary key,
	CustomerName nvarchar(50),
	ContactName nvarchar(50),
	Address nvarchar(50),
	City nvarchar(50),
	PostalCode nvarchar(50),
	Country nvarchar(50)
)
insert into Customers values(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany')
insert into Customers values(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico')
insert into Customers values(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico')
insert into Customers values(4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP	','UK')
insert into Customers values(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','	S-958 22','Sweden')

--tao function loai Multi->co the dinh nghia ra danh sach cot cua bang do luon
select * from Customers;

create function udf_GetNumberOfCustomerByCountry()
returns @numberOfCustomerByCountry table(     --bien tra ve @numberOfCustomerByCountry
	Country nvarchar(50),
	NumberOfCustomer int
)
as
begin
	insert into @numberOfCustomerByCountry
	select Country, count(*) as NumberOfCustomer from Customers
	group by Country
	return 
end

select * from udf_GetNumberOfCustomerByCountry();