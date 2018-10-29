USE AdventureWorks
GO

--SELECT
--	 p.Name ProductName
--	,p.ProductNumber
--	,isnull(p.color, 'NA') Color
--	,p.ListPrice
--	,s.Name SubcategoryName
--	,c.Name as CategoryName
--FROM Production.Product p WITH (NOLOCK)
--inner join Production.ProductSubcategory s with (nolock)
--	on p.ProductSubcategoryID = s.ProductSubcategoryID
--inner join Production.ProductCategory c with (nolock)
--	on c.ProductCategoryID = s.ProductCategoryID

Select
	 soh.OrderDate
	,soh.ShipDate
	,datediff(dd, soh.OrderDate, soh.ShipDate) DaysToShip
	,soh.CustomerID
	,sod.OrderQty
	,sod.LineTotal
	,p.Name ProductName
	,p.ProductNumber
FROM Sales.SalesOrderHeader soh with (nolock)
inner join sales.SalesOrderDetail sod with (nolock)
	on soh.SalesOrderID = sod.SalesOrderID
inner join Production.Product p with (nolock)
	on sod.ProductID = p.ProductID

declare @t bigint = 125469856487

select @t
	,cast(substring(cast(@t as nvarchar(50)),3,4) as int) 
	,substring('125469856487',3,4)
	,CAST(@t % 10000000000 / 1000000 AS INT)


/*
AABBBBCCCDDD
*/


