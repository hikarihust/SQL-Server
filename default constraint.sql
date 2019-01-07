drop table Persons;
--tao moi constraint default ngay tu luc tao bang
CREATE TABLE Persons (    
	ID int NOT NULL,    
	LastName varchar(255) NOT NULL,    
	FirstName varchar(255),    
	Age int,    
	City varchar(255) DEFAULT 'Sandnes'
);
--khi insert thi khi ko chi ra gia tri cho truong City thi no tu nhan gia tri default la Sandnes
insert into Persons(ID, LastName, FirstName, Age)
values(1, 'Nguyen', 'A', 10);
select * from Persons;

--tao moi bang Orders
drop table OrderDetails;
drop table Orders; --phai xoa bang OrderDetails truoc vi trong bang OrderDetails co chua khoa ngoai la Id cua Order
CREATE TABLE Orders (    
ID int NOT NULL,    
OrderNumber int NOT NULL,    
OrderDate date
);

--them constraint default vao bang cach sua bang
--GETDATE() --lay ra ngay hien tai cua server dang chay sql nay
alter table Orders
add constraint DF_OrderDate default getdate()
for OrderDate;

insert into Orders(ID, OrderNumber) values(1, 111);
select * from Orders;

--drop constraint
alter table Orders
drop constraint DF_OrderDate;
insert into Orders(ID, OrderNumber) values(1, 111);
select * from Orders;  --khi do gia tri date dc them moi vao co gia tri la null