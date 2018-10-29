use AdventureWorks
go


;with CTE1
as
(
select
	 AddressLine1
	,City
	,PostalCode
	,SpatialLocation
	,SpatialLocation.STAsText() [LocationLongLat]-- LongLat
	,'51.50079, -0.10317' [WebberStreet]
	,geography::STPointFromText('POINT(-0.10317 51.50079)', 4326) [WebberStPoint]
	,SpatialLocation.STDistance(geography::STPointFromText('POINT(-0.10317 51.50079)', 4326))/1000 [kmFromWebberStreet]
	,ROW_NUMBER() over (order by (SpatialLocation.STDistance(geography::STPointFromText('POINT(-0.10317 51.50079)', 4326))))RN
from Person.Address
)

Select
	 *
from CTE1
where RN between 5 and 11


