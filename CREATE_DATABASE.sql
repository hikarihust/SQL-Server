-- create new database
CREATE DATABASE [sample];

-- delete database
--DROP DATABASE [sample];

-- edit database
ALTER DATABASE [sample] MODIFY NAME=[new-sample];

USE [new-sample];

-- create with options
CREATE DATABASE SALES 
ON
(
	NAME = SALES_DATA,
	FILENAME = 'C:\DATABASE\SALES.MDF',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)
LOG ON
(
	NAME = SALES_LOG,
	FILENAME = 'C:\DATABASE\SALES_LOG.LDF',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)