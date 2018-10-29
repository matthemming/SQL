use kubrick
go
create table baddates
(
baddate varchar(20)
)
go
insert into baddates
values
('12-1-14'),('8-Feb-17'),('09-Apr-2018'),('31-08-17')
go
select * from baddates


-- Can you produce a column of clean dates in the format: yyyy-mm-dd


SELECT
	CASE 
		WHEN CHARINDEX('-',baddate) = 2 THEN concat('0',substring(baddate,1,1))
		ELSE substring(baddate,1,2)
	END [day]
	,CASE 
		WHEN len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1) = 2 THEN concat('20',substring(baddate,CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)+1,len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)))
		ELSE substring(baddate,CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)+1,len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1))
	END [year]
	,case
		when len(substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10)) = 1 then concat('0',substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10))
		when substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10) = 'Feb' then '02'
		when substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10) = 'Apr' then '04'
		else substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10)
	end [month]
FROM baddates


SELECT
	CASE 
		WHEN len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1) = 2 THEN concat('20',substring(baddate,CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)+1,len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)))
		ELSE substring(baddate,CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1)+1,len(baddate)-CHARINDEX('-',baddate,CHARINDEX('-',baddate)+1))
	END
	+
	'-'
	+
	case
		when len(substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10)) = 1 then concat('0',substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10))
		when substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10) = 'Feb' then '02'
		when substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10) = 'Apr' then '04'
		else substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10)
	end
	+
	'-'
	+
	CASE 
		WHEN CHARINDEX('-',baddate) = 2 THEN concat('0',substring(baddate,1,1))
		ELSE substring(baddate,1,2)
	END [date]
FROM baddates

select
substring(substring(baddate, 1, charindex('-',baddate,CHARINDEX('-',baddate)+1)-1), CHARINDEX('-',baddate)+1,10)
FROM baddates
