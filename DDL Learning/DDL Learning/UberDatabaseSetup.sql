use uber
go
--create table person
--(
--personid int not null primary key,
--name varchar(100),
--dob date,
--);
go
--create table paymentcard
--(
--cardid int not null primary key,
--cardno char(16),
--expiry char(4),
--cvv char(3),
--cardtype varchar(20),
--personid int not null,
--);
go
--ALTER TABLE paymentcard     
--ADD CONSTRAINT FK_cardowner FOREIGN KEY (personid)     
--    REFERENCES person (personid)       
--;
GO
--create table paymentcard
--(
--cardid int not null primary key,
--cardno char(16),
--expiry char(4),
--cvv char(3),
--cardtype varchar(20),
--personid int not null,
--);
--create database uber
go
--create table passenger
--(
--riderid int not null primary key,
--email varchar(100),
--passwordhash varchar(100),
--phoneno varchar(20),
--name varchar(100),
--);
go
--create table driver
--(
--driverid int not null primary key,
--email varchar(100),
--passwordhash varchar(100),
--phoneno varchar(20),
--name varchar(100),
--dob date,
--licensecouncil varchar(100),
--carid int
--);
go
--create table trip
--(
--tripid int not null primary key,
--driverid int,
--riderid int,
--ubertype varchar(100),
--price money,
--driverrating int,
--riderrating int
--);
go
--create table carddetails
--(
--cardid int not null primary key,
--name varchar(100),
--cardno char(16),
--expiry char(4),
--cvv char(3),
--cardtype varchar(20),
--riderid int not null,
--);
go
--create table tripgps
--(
--gpsid int not null primary key,
--tripid int not null,
--longitude float,
--latitude float,
--gpstime datetime,
--);
go
--ALTER TABLE carddetails     
--ADD CONSTRAINT FK_cardowner FOREIGN KEY (riderid)     
--    REFERENCES passenger (riderid)       
--;
go
--ALTER TABLE trip     
--ADD CONSTRAINT FK_triprider FOREIGN KEY (riderid)     
--    REFERENCES passenger (riderid)       
--;
go
--ALTER TABLE trip     
--ADD CONSTRAINT FK_tripdriver FOREIGN KEY (driverid)     
--    REFERENCES driver (driverid)       
--;
go
--ALTER TABLE tripgps     
--ADD CONSTRAINT FK_tripid FOREIGN KEY (tripid)     
--    REFERENCES trip (tripid)       
--;
go

--create schema tripinfo
go
--alter schema tripinfo
--transfer dbo.trip
go
--alter schema tripinfo
--transfer dbo.tripgps
go
--create schema peopleinfo
go
--alter schema peopleinfo
--transfer dbo.passenger
go
--alter schema peopleinfo
--transfer dbo.driver
go
--alter schema peopleinfo
--transfer dbo.carddetails
go
--exec sp_rename 'peopleinfo.carddetails', [cards]
go
--create schema trash
go