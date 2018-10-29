use CrimeProject
go

with CTE1
as
(
select --top 10
	 f.CrimeRecordID
	,f.Date
	,f.LSOACode
	,l.Borough
	,f.Longitude
	,f.Latitude
	,ct.CrimeType
	,pop.Population
	,hp.MedianHousePrice
	,hp.NormalisedHousePrice
	,case	 -- Turned into floats to allow sequential plotting in Tableau
	   when hp.NormHPBin5 = '1.6+' then 1.6
	   else cast(hp.NormHPBin5 as float)
     end NormHPBin5
--into tableau.joined_table_for_tableau
from FactTable f
inner join [dbo].[DimCrimeType] ct
	on f.CrimeTypeID = ct.CrimeTypeID
inner join DimLocation l
	on f.LSOACode = l.LSOACode
left join census.LSOAPopulation pop -- 4993018 rows with inner join - no 2017
	on f.LSOACode = pop.LSOACode
	and year(f.Date) = pop.Year
left join property.LSOAHousePrices hp -- 4816154 rows with inner join - no house price data for some LSOA-Years
	on f.LSOACode = hp.LSOACode
	and year(f.Date) = hp.Year
)

select top 100 
	 *
	,count(*) over (partition by NormHPBin5, CrimeType)-- / Population
from CTE1
where NormHPBin5 is not null



