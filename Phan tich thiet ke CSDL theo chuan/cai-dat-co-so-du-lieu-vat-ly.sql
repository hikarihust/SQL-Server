Use master
GO
CREATE DATABASE OnlineShop
GO
USE OnlineShop
GO 
CREATE TABLE Invoice(
	InvoiceNumber		int not null primary key,
	CustomerId			int,
	InvoiceDate	   datetime,
	VATRate				int,
	Other			  float	
)
select * from Invoice
sp_help Invoice  --xem thong tin bang Invoice

----------------------------------------------------------------------------
--voi cach tao bang nhu tren thi he thong tu tao ten cho index va constraint ra-> kho kiem soat

drop table Invoice
GO 
CREATE TABLE Invoice(
	InvoiceNumber		int constraint PK_Invoice primary key,
	CustomerId			int,
	InvoiceDate	   datetime,
	VATRate				int,
	Other			  float	
)

CREATE TABLE InvoiceDetails(
	InvoiceNumber	  int,
	ProductCode		  int,
	Quantity		float,
	Price			  int
	constraint PK_InvoiceDetails primary key(InvoiceNumber, ProductCode)
)


sp_help InvoiceDetails 

--template viet cau truy van
SELECT
	I.InvoiceNumber
	,I.InvoiceDate
	--,ID.ProductCode
	,ID.Price
	,ID.Quantity 
	FROM Invoice AS I
	JOIN InvoiceDetails AS ID ON I.InvoiceNumber = ID.InvoiceNumber
	WHERE I.InvoiceDate BETWEEN '04-08-2016' AND '04-08-2017'
	AND ID.Price >= 1000000