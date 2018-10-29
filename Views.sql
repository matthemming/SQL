use AdventureWorks
go


create view vw_portfolio
as
select
	 p.*
	,s.Name as SubcategoryName
from Production.Product p
inner join Production.ProductSubcategory s
	on p.ProductSubcategoryID = s.ProductSubcategoryID
go

select vw_portfolio

exec sp_spaceused 'Production.Product'

