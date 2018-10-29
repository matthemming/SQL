use AdventureWorks
go

select * from Production.Product
go

create trigger tr_UpdateTimestamp
on Production.Product
for update
as
begin

update p
set ModifiedDate = GETDATE()
from Production.Product p
inner join inserted i
	on p.ProductID = i.ProductID

end

update Production.Product
set ListPrice = 23
where ProductID = 1
