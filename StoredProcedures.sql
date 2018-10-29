--create schema dummy
--go
--create table dummy.people
--(
--pid int identity(1,1),
--name varchar(50),
--added_date date default getdate(),
--isenabled bit default 1
--)

--create table dummy.address
--(
--addressid int identity(1,1)
--,[address] varchar (500)
--,pid int
--)

select * from dummy.people

alter proc dummy.usp_addpersonaddress
@name varchar(50), 
@address varchar(500),
@personid int output,
@addressid int output
as

begin tran
	begin try
		insert dummy.people
		(name)
		values
		(@name)
	end try
	begin catch
		rollback tran
		return
	end catch
	
	select @personid = SCOPE_IDENTITY()

	begin try
		insert dummy.address
		(address, pid)
		values
		(@address, @personid)
	end try
	begin catch
		rollback tran
		return
	end catch
	
	select @addressid = SCOPE_IDENTITY()

commit tran
go

select * from dummy.people
select * from dummy.address


declare @p int
declare @a int
declare @status int

exec @status =  dummy.usp_addpersonaddress 'Biff', 'McFly St', @p output, @a output

select @p
select @a
select @status
-- inserting via a kind of copy and paste

--select top 10 * from AdventureWorks.Person.Person

--insert into dummy.people
--(name)
--(select
--	firstname + ' '  lastname
--from AdventureWorks.Person.Person
--)

--select * from dummy.people
