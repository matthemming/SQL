-- recursive CTE
use kubrick
go

create proc usp_BuildDimDate
as

if OBJECT_ID('DimDate') is not null
begin
	drop table DimDate
end

;with cte
as
(
--anchor
select
	 cast('1992-12-04' as date) as dt
	,year(cast('1992-12-04' as date)) yr
	,month(cast('1992-12-04' as date)) mnth
	,datepart(dd, cast('1992-12-04' as date)) dy
	,datename(dw, cast('1992-12-04' as date)) daynm
	,case
		when datename(dw, cast('1992-12-04' as date)) in ('Saturday', 'Sunday') then 0
		else 1
	 end WeekdayFlag
	 ,case
		when month(cast('1992-12-04' as date)) in (12, 1, 2) then 'Winter'
		when month(cast('1992-12-04' as date)) in (3, 4, 5) then 'Spring'
		when month(cast('1992-12-04' as date)) in (6, 7, 8) then 'Summer'
		else 'Autumn'
	 end Season
union all
select
	 dateadd(dd, 1, dt)
	,year(dateadd(dd, 1, dt))
	,month(dateadd(dd, 1, dt))
	,datepart(dd, dateadd(dd, 1, dt))
	,datename(dw, dateadd(dd, 1, dt))
	,case
		when datename(dw, dateadd(dd, 1, dt)) in ('Saturday', 'Sunday') then 0
		else 1
	 end
	 ,case
		when month(dateadd(dd, 1, dt)) in (12, 1, 2) then 'Winter'
		when month(dateadd(dd, 1, dt)) in (3, 4, 5) then 'Spring'
		when month(dateadd(dd, 1, dt)) in (6, 7, 8) then 'Summer'
		else 'Autumn'
	 end WeekdayFlag
from cte
where dateadd(dd, 1, dt) < dateadd(yy, 1, getdate())
)

select 
	*
into DimDate
from cte
option (maxrecursion 0)
go