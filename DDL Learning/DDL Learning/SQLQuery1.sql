use uber
go
if object_id('[peopleinfo].[cards]') is not null
drop table peopleinfo.cards
go
create table peopleinfo.cards
(
cardid int not null primary key,
cardno char(16),
expiry char(4),
cvv char(3),
cardtype varchar(20),
personid int not null,
);
go