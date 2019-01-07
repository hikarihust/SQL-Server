--tao 1 cluster index tren 1 bang chua co khoa chinh, neu co roi thi ko tao duoc
create clustered index IX_Product_Id
on Products(Id);

--tao them 1 bang Products ko co index de thuc hien select 2 bang co index va ko co index
CREATE TABLE [dbo].[Products_NoIndex](
	[Id] [int] NULL,
	[Name] [nvarchar](40) NULL,
	[Price] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products_NoIndex]  WITH CHECK ADD  CONSTRAINT [CK_Price1] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Products_NoIndex] CHECK CONSTRAINT [CK_Price1];

insert into Products_NoIndex values(1,'Name 1',100)
insert into Products_NoIndex values(2,'Name 2',200)
insert into Products_NoIndex values(3,'Name 3',300)
--thuc hien select
select * from Products where Id = 1;  --clustered index seek -> nhanh hon
select * from [Products_NoIndex] where Id = 1;  --table scan -> phai scan ca bang nen mat nhiu time hon


--drop index
drop index IX_Product_Id
on Products

--tao 1 non clustered index tren bang da co 1 clustered index
select * from Products where Name = 'Name 1' and Price = 20; --toi uu hoa cau lenh nay->tao them non clustered index
create nonclustered index IX_Products_NamePrice
on Products(Name, Price);

select * from Products where Name = 'Name 1' and Price = 20; --index seek(Non clustered) -> cung ko can scan toan bo bang nua

select * from Products where substring(Name, 0, 3) = 'Name 1' and Price = 20;