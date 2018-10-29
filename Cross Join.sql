use Kubrick	
go
--create table suits
--(
--suit varchar(20)
--)
--go

--insert into suits
--values
--('CLUBS'), ('SPADES'), ('HEARTS'), ('DIAMONDS')
--go

--create table cards
--(
--card char(2)
--)
--go

--insert into cards
--values
--('A'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), 
--('8'), ('9'), ('10'), ('K'), ('J'), ('Q')
--go

;with deck 
as
(
select 
	 s.suit
	,c.[card]
	,ROW_NUMBER() over (order by (select 'blablabla')) RN
from suits s
cross join cards c
)

--select abs(checksum(newid()) % 53)


select top 1
	*
	,cast(deck.RN as int)
from deck
where cast(deck.RN as int) = cast(abs(checksum(newid()) % 52) +1 as int)

