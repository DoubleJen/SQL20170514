use Northwind
go

select * from products

select * from products order by unitPrice ASC

select 
  rank() over (order by unitPrice) as RankNo
  , * from products order by unitPrice ASC

select 
  dense_rank() over (order by unitPrice) as RankNo
  , * from products order by unitPrice ASC

select 
  row_number() over (order by unitPrice) as RankNo
  , * from products order by unitPrice ASC

select 
  ntile(5) over (order by unitPrice) as RankNo
  , * from products order by unitPrice ASC




select 
  rank() over (partition by categoryID order by unitPrice) as RankNo
  , * from products order by categoryID ASC, unitPrice ASC