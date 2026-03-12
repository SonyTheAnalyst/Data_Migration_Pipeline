CREATE TABLE DimProduct (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price FLOAT,
    FileName VARCHAR(100),
    LoadDate DATETIME2(0)
);


CREATE TABLE FileTracker (
    FileName VARCHAR(100) ,
    LoadDate DATETIME2(0)
);

select * from FileTracker
select * from DimProduct
