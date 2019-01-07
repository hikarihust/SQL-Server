create procedure usp_MakeOrder
as
	begin
		insert into Orders values(1, '001', GETDATE());
		update Products set Quantity = Quantity -1 where Id =1;
	end

select * from Orders;
select * from Products;
--thuc thi procedure
exec usp_MakeOrder

--sua procedure
alter procedure usp_MakeOrder
as
	begin
		insert into Orders values(1, '001', GETDATE());
		update Products set Quantity = Quantity -1 where Id =1;
	end

--xoa procedure
drop procedure usp_MakeOrder;


-------------------------------input va output------------------------------
--input, giup ta truyen cac tham so khac nhau - truyen vao Id cua Product
alter procedure usp_MakeOrder
@productId int
as
	begin
		insert into Orders values(1, '001', GETDATE());
		update Products set Quantity = Quantity -1 where Id = @productId;
	end
--them du lieu vao cho bang Products
insert into Products values(1, 'Product 1', 18, 4);
insert into Products values(2, 'Product 2', 18, 4);
select * from Orders;
select * from Products;
--truyen tham so va thuc thi procedure 
exec usp_MakeOrder 2

--khi co 2 hoac nhieu tham so 
alter procedure usp_MakeOrder
@productId int,
@orderId int
as
	begin
	set nocount on; --neu ko set la on thi khi thuc thi procedure thuc hien insert, update... thi no se hien thi ra so dong bi anh huong la bao nhieu
		insert into Orders values(@orderId, '001', GETDATE());
		update Products set Quantity = Quantity -1 where Id = @productId;
	end
exec usp_MakeOrder 2, 5;

--output, giong nhu 1 bien reference-> out ra gia tri nay va minh co the hung lay ra tri do - vi du phan trang
select * from Student;
create proc GetStudentPaging
@pageIndex int,
@pageSize int,
@totalRow int output  --tong so trang
as
begin
	select @totalRow  = count(*) from Student;   --tra ve tong so ban ghi, day la bien output-> ta co the hung duoc no
	select * from (
			select ROW_NUMBER() over(order by Id) as RowNumber, * from Student
			) as a
		where a.RowNumber > (@pageSize * (@pageIndex-1))
		and a.RowNumber <= (@pageSize * (@pageIndex-1)) + @pageSize
end
--trang thu nhat
declare @totalRow int   --khai bao bien @totalRow
exec GetStudentPaging 1, 2, @totalRow output;
select @totalRow;

--trang thu 2
declare @totalRow int 
exec GetStudentPaging 2, 2, @totalRow output;
select @totalRow;