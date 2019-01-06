--ten CustomerName bat dau tu chu a
select * from Customers
where CustomerName like 'a%';

--ten CustomerName ket thuc la chu a
select * from Customers
where CustomerName like '%a';

--ten CustomerName chua 2 ky tu lien nhau la or
select * from Customers
where CustomerName like '%or%';

--ten CustomerName chua ky tu thu 2 la r
select * from Customers
where CustomerName like '_r%';

--ten CustomerName chua ky tu a o dau va co it nhat 3 ky tu
select * from Customers
where CustomerName like 'a_%_%';

--ten CustomerName chua ky tu a o dau va ky tu e o cuoi
select * from Customers
where CustomerName like 'a%e';

--ten CustomerName khong chua ky tu a o dau va ky tu e o cuoi
select * from Customers
where not CustomerName like 'a%e';

select * from Customers
where CustomerName not like 'a%e';