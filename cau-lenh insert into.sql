--Khong chi ra insert cot nao thi values phai chi ra het
insert into Customers values(6, 'Name 1', 'Contact name 1', 'Address 1', 'City 1', '10000', 'Viet Nam');

--Co chi ra la insert vao cot nao
insert into Customers(CustomerId, CustomerName) values(7, 'Name 2');

--insert vao nhieu row cung luc
insert into Customers(CustomerId, CustomerName) values(8, 'Name 3'), (9, 'Name 4');

--insert tu 1 cau lenh select
insert into Product2(ProductId, ProductName)
(select ProductId, ProductName from Products1 where ProductId < 4);
