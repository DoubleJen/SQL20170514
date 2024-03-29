use northwind
go

select * from products

select ProductID, ProductName, UnitPrice
  from products

select CategoryID, AVG(UnitPrice) as AvgPrice 
  from products
  group by CategoryID

select AVG(UnitPrice) as AvgPrice 
  from products
  where CategoryID = 1

select ProductID, ProductName, UnitPrice,
  (select AVG(UnitPrice) as AvgPrice 
  from products 
  where CategoryID = 1)
  from products

select CategoryID, ProductID, ProductName, UnitPrice,
  (select AVG(UnitPrice) as AvgPrice 
  from products i
  where i.CategoryID = o.CategoryID)
  from products o

select CategoryID, ProductID, ProductName, UnitPrice,
  (select AVG(UnitPrice) as AvgPrice 
  from products i
  where i.CategoryID = o.CategoryID),
  ((select AVG(UnitPrice) as AvgPrice 
  from products i
  where i.CategoryID = o.CategoryID) - UnitPrice) as ���t 
  from products o
  go

-- Scalar User-defined Function
Create Function fn_AVGPrice
  (@CategoryNo as int)
returns money
as
begin
  declare @Result money
  select @Result = AVG(UnitPrice)
    from products
    where CategoryID = @CategoryNo
  return @Result
end

select CategoryID, ProductID, ProductName, UnitPrice, dbo.fn_AvgPrice(CategoryID)
  from products
  go

-- In-line Table-valued Function
USE Northwind
GO

CREATE FUNCTION fn_CustomerNamesInRegion
   ( @RegionParameter nvarchar(30) )
RETURNS table
AS
RETURN (
   SELECT CustomerID, CompanyName
   FROM Northwind.dbo.Customers
   WHERE Region = @RegionParameter
   )
GO

SELECT * FROM fn_CustomerNamesInRegion('WA') 
GO


-- Multi-Statement Table-valued Function
USE Northwind
GO

CREATE FUNCTION fn_Employees (@length nvarchar(9))
RETURNS @fn_Employees table
   (EmployeeID int PRIMARY KEY NOT NULL,
   [Employee Name] nvarchar(61) NOT NULL)
AS
BEGIN
   IF @length = 'ShortName'
      INSERT @fn_Employees SELECT EmployeeID, LastName
      FROM Employees
   ELSE IF @length = 'LongName'
      INSERT @fn_Employees SELECT EmployeeID,
      (FirstName + ' ' + LastName) FROM Employees
RETURN
END
GO

SELECT * FROM dbo.fn_Employees('LongName')
-- SELECT * FROM dbo.fn_Employees('ShortName')

