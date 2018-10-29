-- Summarizing / Aggregating

-- Group By


use AdventureWorks
go

--SELECT
--	 year(soh.OrderDate) OrderYear
--	,avg(sod.OrderQty) AvgOrderSize
--	,min(sod.OrderQty) MinOrderSize
--	,max(sod.OrderQty) MaxOrderSize
--	,round(stdev(sod.OrderQty), 1) OrderSizeStDev
--FROM sales.SalesOrderHeader soh
--inner join Sales.SalesOrderDetail sod with (nolock)
--	on soh.SalesOrderID = sod.SalesOrderID
--group by year(soh.OrderDate)
--order by OrderYear



/*
Products that have not been bought in the year 2008
*/

select
	 ProductID
from Production.Product
except
select
	ProductID
FROM Sales.SalesOrderHeader soh with (nolock)
inner join sales.SalesOrderDetail sod with (nolock)
	on soh.SalesOrderID = sod.SalesOrderID
where year(soh.OrderDate) = 2008



--select
--	ProductID
--from Production.Product
--intersect
--select
--	productid
--from Sales.SalesOrderDetail



--select
--	*
--from Production.Product
--where ProductID
--in
--(
--select
--	ProductID
--from Production.Product
--intersect
--select
--	productid
--from Sales.SalesOrderDetail
--)