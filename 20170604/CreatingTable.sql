-- 建立/修改/刪除資料表

use northwind
go

if exists (select * from sysobjects where type = 'U' and name = 'member')
drop table Member
go
--sysobjects
--確認有無會員資料表


Create table Member
(
  MemberID varchar(10) not null primary key,
  MemberName varchar(10) not null
)
go

-- drop table member

-- select * from member


alter table Member add Email varchar(30)
go

-- select * from member

alter table Member alter column Email varchar(50)
go

exec sp_help Member
go

exec sp_rename 'member.Email', 'E_mail', 'column'
go

exec sp_help Member
go

exec sp_rename 'member.E_mail', 'Email', 'column'
go

exec sp_help Member
go

drop table member
go

-- 計算型欄位
use northwind
go

if exists (select * from sysobjects where type = 'U' and name = 'TestCalc')
  drop table TestCalc
go

create table TestCalc
(
  idField int not null primary key,
  price int,
  qty int,
  amount as price * qty
			--計算型欄位: 欄位名稱 as 公式
)
go

-- keyin some data to TestCalc for testing

drop table TestCalc
go
