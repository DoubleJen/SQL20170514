-- ���q 23 ���ӫ~�ӥB�q�W�L 20 �Ӫ��q��

use Northwind
go

-- �_
select * from Orders

-- ��
select CustomerID, OrderID, OrderDate from Orders

-- ��
select * from [Order Details]

select * from [Order Details] where ProductID = 23 and Quantity > 20

-- �X
	--select CustomerID, OrderID, OrderDate from Orders
	--  where OrderID in (10337, 10348, 10396, ...)

select CustomerID, OrderID, OrderDate from Orders
  where OrderID in 
  (
	select OrderID from [Order Details] where ProductID = 23 and Quantity > 20
  )