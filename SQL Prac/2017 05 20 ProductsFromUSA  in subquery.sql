-- �C�X���Ө��������~�M��

use Northwind
go

-- �_
select * from Products
select * from Suppliers

-- ��
select CategoryID, SupplierID, ProductID, ProductName
  from Products

-- ��
select * from Suppliers where Country = 'USA'

select SupplierID from Suppliers where Country = 'USA'

-- �X
	--select CategoryID, SupplierID, ProductID, ProductName
	--  from Products
	--  where SupplierID in (...)

select CategoryID, SupplierID, ProductID, ProductName
  from Products
  where SupplierID in (select SupplierID from Suppliers where Country = 'USA')