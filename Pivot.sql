use AdventureWorks
go

--select
--	*
----into SaleByMonthColor
--from
--(
--select
--	 datename(mm, soh.orderdate) MonthOfOrder
--	,sod.LineTotal
--	,p.color as ProductColor
--from Sales.SalesOrderHeader soh
--inner join Sales.SalesOrderDetail sod
--	on soh.SalesOrderID = sod.SalesOrderID
--inner join Production.Product p
--	on sod.ProductID = p.ProductID
--where 1=1
--	and year(soh.orderDate) = 2007
--) c
--pivot (
--sum(LineTotal) for ProductColor in ([Black], [Blue], [Grey], [Multi], [Red], 
--									[Silver], [Silver/Black], [White], [Yellow])
--) p

select 
	 MonthOfOrder
	,Color
	,SaleCount
from
(
select
	*
from SaleByMonthColor
) c
unpivot
(
SaleCount for Color in
([Black], [Blue], [Grey], [Multi], [Red], 
[Silver], [Silver/Black], [White], [Yellow])
) up