use Kubrick
go

--create table resorts
--(
--location varchar(100),
--country varchar(100)
--)
--go

--create table climate
--(
--location varchar(100),
--recent_temps varchar(100)
--)
--go

--insert into resorts
--values
--('Croydon', 'England'),
--('Ipswich', 'England'),
--('Inverness', 'Scotland')
--go

--insert into climate
--values
--('Croydon', '31., 15.6, 23.1'),
--('Ipswich', '8.3, 15.6, 16.9'),
--('Inverness', '15.2, 16.4, 3.5')
--go

select
	 r.*
	,t.Value
from resorts r
inner join climate c
	on r.location = c.location
cross apply AdventureWorks.[dbo].[SplitString](c.recent_temps, ',') t

