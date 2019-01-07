use HUST;
drop table Orders;
drop table OrderDetails;


create table OrderDetails(
	OrderId int,
	ProductId int,
	Quantity int,
	Price decimal,
	constraint PK_OrderDetails_OrderId_ProductId 
	primary key(OrderId, ProductId)
);

create table Orders(
	OrderId int primary key,
	CreateDate datetime,
	CustomerId int
);

alter table OrderDetails
add Foreign key (OrderId) references Orders(OrderId);

alter table OrderDetails
drop constraint FK__OrderDeta__Order__4BAC3F29;

--tao Foreign key tu luc tao bang
create table OrderDetails(
	OrderId int foreign key references Orders(OrderId),
	ProductId int,
	Quantity int,
	Price decimal,
	constraint PK_OrderDetails_OrderId_ProductId 
	primary key(OrderId, ProductId)
);
