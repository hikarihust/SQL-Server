drop table Orders;
CREATE TABLE [dbo].[Orders](
	[ID] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [datetime] NULL
) ON [PRIMARY]
insert into Orders values(1, 1000, GETDATE());
insert into Orders values(2, 2000, '2019-01-06 10:20:20');
select * from Orders;
--khi lam viec voi date thi nen bo qua time di de so sanh ngay de hon
select * from Orders where OrderDate = '2019-01-07';   --khong co ket qua nao thoa man
--co ca time nen phai select theo ca time thi moi co ra duoc ket qua
select * from Orders where OrderDate = '2019-01-06 10:20:20';



--cac ham thoi gian - cung co cac tham so nhu ham binh thuong. GETDATE la ham khong co tham so de lay ra thoi gian hien tai
select getdate(), DATEADD(day, -365, getdate());
select getdate(), DATEADD(MONTH, 3, getdate());
select getdate(), DATEADD(YEAR, 3, getdate());
select getdate(), DATEADD(MONTH, 3, '2019-01-07');
--lay khoang cach giua 2 ngay, ung dung nhu la tinh toan xem con bao nhiu ngay nua thi het han thanh vien...
select DATEDIFF(day, getdate(), '2019-12-31');
select DATEDIFF(MONTH, getdate(), '2019-12-31');
--lay ra 1 phan cua ngay thang
select DATEPART(day, getdate());
select DATEPART(MONTH, getdate());
select DATEPART(YEAR, getdate());
select DATEPART(HH, getdate());
--lay theo gio UTC - lay theo gio cua mui gio +0
select GETUTCDATE();
