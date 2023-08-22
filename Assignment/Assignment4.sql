create database Assignment4Db
use Assignment4Db

create Table Products
(PId int primary key identity(500,1),
PName nvarchar(50) not null,
PPrice float,
PTax as PPrice * 0.10 Persisted,
PCompany nvarchar(50),PQty int Default 10 check (PQty>=1))

select * from Products

insert into Products(PName,PPrice,PCompany) values 
('Mobile' , 25000,'Samsung'),
('Earbuds',12000,'Apple'),
('Laptop',90000,'Redmi'),
('Mobile',35000,'HTC'),
('Earphone',6000,'RealMe'),
('TV',45000,'Xiaomi'),
('Tablet',89000,'Apple'),
('SmartWatch',11000,'Samsung'),
('Earbuds',5000,'Realme'),
('Laptop',150000,'Apple')

select * from Products

create proc Tprice
with encryption
as
begin
select PId,PName,(PPrice+PTax) as PricewithTax,PCompany,
(PQty * (PPrice+PTax)) as TotalPrice from Products
end

exec sp_helptext Tprice

create proc Tprice2
@company nvarchar(50),
@totaltax float output
with encryption
as
select @totaltax =SUM(PTax)
from Products where PCompany = @company
declare @ProdTax float
exec Tprice2
@company='Apple', @totaltax = @ProdTax output
print @totaltax

execute sp_helptext Tprice2