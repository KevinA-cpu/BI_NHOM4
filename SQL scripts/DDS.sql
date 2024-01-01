CREATE DATABASE BI_DDS;
GO
USE BI_DDS;
GO
-- Create Date Dimension table
CREATE TABLE DateDimension (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	DateID INT UNIQUE,
    Day INT,
    Month INT,
    Year INT,
    Time time(7)
);


-- Create ProductLine Dimension table
CREATE TABLE ProductLineDimension (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductLineID NVARCHAR(255) UNIQUE,
    ProductLine NVARCHAR(255),
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

-- Create Product Dimension table
CREATE TABLE ProductDimension (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID NVARCHAR(255) UNIQUE,
    UnitPrice FLOAT,
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
    ProductLineID NVARCHAR(255) FOREIGN KEY REFERENCES ProductLineDimension(ProductLineID)
);

-- Create Branch Dimension table
CREATE TABLE BranchDimension (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Branch NVARCHAR(255) UNIQUE,
    City NVARCHAR(255),
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

-- Create Fact Table
CREATE TABLE SupermarketSalesFact (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	InvoiceID NVARCHAR(255) UNIQUE,
    BranchID NVARCHAR(255) FOREIGN KEY REFERENCES BranchDimension(Branch),
    CustomerType NVARCHAR(255),
    Gender NVARCHAR(255),
    ProductID NVARCHAR(255) FOREIGN KEY REFERENCES ProductDimension(ProductID),
    Quantity INT,
    Tax5Percent FLOAT,
    Total FLOAT,
    DateID INT FOREIGN KEY REFERENCES DateDimension(DateID),
    Payment NVARCHAR(255),
    Cogs FLOAT,
    GrossMarginPercentage FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
	CreatedDate Datetime,
	UpdateDate Datetime,
	SourceID INT
);
