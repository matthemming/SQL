use CamdenRestaurants

--select * from FoodHygieneRating


--if object_id('FoodWithGeo') is not null
--drop table FoodWithGeo
--go

--select
--	 [Business Name]
--	,cast([Rating Value] as int) * cast([Confidence In Management Score] as int) OverallRating
--	,'POINT(' + Longitude + ' ' + Latitude + ')' [LongLat]
--	,geometry::STPointFromText('POINT(' + Longitude + ' ' + Latitude + ')', 4326) [RestoPointRef]
--	into FoodWithGeo
--from FoodHygieneRating
--where lower([Business Type Description]) like '%restaurant%'

--alter table FoodWithGeo
--add restaurantID int identity primary key

--select * from FoodWithGeo

--if object_id('LSOAWithGeo') is not null
--drop table LSOAWithGeo
--go

--select
--	  [LSOA 2011 Name]
--	 ,[the_geom]--.ST_MakePolygon()
--	 ,geometry::STPolyFromText(REPLACE(the_geom,'LINESTRING','POLYGON (') +')', 4326) [LSOAPoly]
--into LSOAWithGeo
--from CamdenLSOA

--alter table LSOAWithGeo
--add LSOAID int identity primary key

;with RankCTE
as
(
select 
	 *
	,FoodWithGeo.RestoPointRef.STIntersects(LSOAWithGeo.LSOAPoly) RestInLSOA
	,dense_rank() over (partition by [LSOA 2011 Name] order by OverallRating DESC) RankInLSOA
from LSOAWithGeo
cross join FoodWithGeo
where FoodWithGeo.RestoPointRef.STIntersects(LSOAWithGeo.LSOAPoly) = 1
)

Select
	 [LSOA 2011 Name]
	,[Business Name]
	,[OverallRating]
from RankCTE
where RankInLSOA = 1