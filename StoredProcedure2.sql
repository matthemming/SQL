use AdventureWorks

alter proc dbo.orderdateselect
@sdate date, 
@edate date
as
declare @clean_edate date
set @clean_edate = EOMONTH(@edate)
declare @clean_sdate date
set @clean_sdate = dateadd(dd, 1, EOMONTH(dateadd(mm,-1,@sdate)))
if isdate(cast(@sdate as varchar(30))) = 0 or isdate(cast(@edate as varchar(30))) = 0
begin
	print 'The date is in the wrong format - input YYYY-MM-DD'
end
select
	 p.Name
	,sod.OrderQty
	,sod.LineTotal
	,soh.orderDate
from Sales.SalesOrderHeader soh
inner join Sales.SalesOrderDetail sod
	on soh.SalesOrderID = sod.SalesOrderID
inner join Production.Product p
	on sod.ProductID = p.ProductID
where 1=1
	and (soh.orderDate) between @clean_sdate and @clean_edate
go

exec dbo.orderdateselect '2005-04-04', '2007-04-04' 

