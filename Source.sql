create database BI_SOURCE
go
use BI_SOURCE
-- Create ProductLine table
CREATE TABLE PRODUCT_LINE (
	ProductLineID NVARCHAR(255) PRIMARY KEY,
    ProductLine NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go

create trigger UPDATE_PRODUCT_LINE on PRODUCT_LINE after update  as 
begin 
	update PRODUCT_LINE
	set UpdateDate = GETDATE()
	where ProductLineID in (select distinct ProductLineID from inserted)
end
go
-- Create Product table
CREATE TABLE PRODUCT (
	ProductID NVARCHAR(255) PRIMARY KEY,
    UnitPrice FLOAT,
	ProductLine NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_PRODUCT on PRODUCT after update  as 
begin 
	update PRODUCT
	set UpdateDate = GETDATE()
	where ProductID in (select distinct ProductID from inserted)
end
go


-- Create Branch table
CREATE TABLE BRANCH (
	Branch NVARCHAR(255)  PRIMARY KEY,
    City NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_BRANCH on BRANCH after update  as 
begin 
	update BRANCH
	set UpdateDate = GETDATE()
	where Branch in (select distinct Branch from inserted)
end
go

-- Create SUPERMARKET_SALES Table
CREATE TABLE SUPERMARKET_SALES(
	InvoiceID NVARCHAR(255),
	Branch  NVARCHAR(255),
    CustomerType NVARCHAR(255),
    Gender NVARCHAR(255),
    ProductID NVARCHAR(255),
    Quantity INT,
    Tax5Percent FLOAT,
    Total FLOAT,
    Date Date,
	Time Time(7),
	Payment NVARCHAR(255),
    Cogs FLOAT,
    GrossMarginPercentage FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_SUPERMARKET_SALES on SUPERMARKET_SALES after update  as 
begin 
	update SUPERMARKET_SALES
	set UpdateDate = GETDATE()
	where InvoiceID in (select distinct InvoiceID from inserted)
end
go


--delete from BRANCH
--delete from SUPERMARKET_SALES
--delete from PRODUCT
--delete from PRODUCT_LINE