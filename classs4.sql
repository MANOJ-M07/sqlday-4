create database Day4Db
use Day4Db
--create proc procName
--@parameters
--as
--sql statement
---------------------------------------
create table Employee
(Id int primary key,
Fname nvarchar(50),
Lname nvarchar(50),
Designation nvarchar(50),
Salary float,
DOJ datetime)
insert into Employee values(6,'sam','Dicosta','Manager',99000.90,'10/12/2012')
insert into Employee values(4,'Raj','Kumar','Developer',99000.90,'10/12/2013')
insert into Employee values(3,'Ravi','Singh','Tester',99000.90,'10/12/2014')
insert into Employee values(2,'Priya','Garg','Developer',99000.90,'10/12/2019')
select * from Employee
----------------------------
create proc usp_sPro
as
select * from Employee

exec usp_sPro
-------------------------------
create proc usp_sEmpById
@id int
as
select * from Employee where Id=@id
exec usp_sEmpById 2
exec usp_sEmpById 6
exec usp_sEmpById 5
--------default----------------
create proc usp_EmpById
@id int = 1
as
select * from Employee where Id = @id

exec usp_EmpById 2
exec usp_EmpById

alter proc usp_EmpById
@id int = 3
as
select * from Employee where Id = @id

exec usp_EmpById 6
exec usp_EmpById 9
exec usp_EmpById
--------------------------------------------------------------------
create proc usp_iEmp
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@desg nvarchar(50),
@sal float,
@doj datetime
as 
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ)values(@id,@fn,@ln,@sal,@desg,@doj)
if(@@ROWCOUNT>=1)
print 'Record Inserted!!'

exec usp_iEmp 1,'Renu','Gupta','HR',552440.20,'12/02/2022'
---------------------------------------------------------------------------------
create proc usp_uEmp
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@desg nvarchar(50),
@sal float,
@doj datetime
as 
update Employee set Id = @id,Fname = @fn, Lname=@ln,Designation = @desg,Salary=@sal,DOJ=@doj where Id=@id
if(@@ROWCOUNT>=1)
print'Record Updated!!!'

exec usp_uEmp 4,'smith','k','manager',26154.20,'21/02/2022'
exec usp_sPro

-------------------------------------------------------------------------
create proc usp_dEmp
@id int
as
delete from Employee where Id =@id
if(@@ROWCOUNT>=1)
print'Record Deleted!!!'
exec usp_dEmp 6
exec usp_sPro
----------------------------------------------------------------
exec sp_server_info
exec sp_tables
exec sp_help
exec sp_helptext 'Usp_uEmp'
----------------------------------------------------
exec sp_helptext usp_dEmp

alter proc usp_dEmp
@id int
with encryption 
as
delete from Employee where Id=@id
if(@@ROWCOUNT>=1)
print 'record deletted!!!'
exec sp_helptext usp_dEmp


alter proc usp_uEmp
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@desg nvarchar(50),
@sal float,
@doj datetime
as 
update Employee set Id = @id,Fname = @fn, Lname=@ln,Designation = @desg,Salary=@sal,DOJ=@doj where Id=@id
if(@@ROWCOUNT>=1)
print'Record Updated!!!'

exec sp_helptext usp_uEmp
select * from Employee
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (11,'sam','dicosta',90000,'manager','12/02/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (12,'Antony','das',10000,'tester','12/09/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (13,'kholi','dicosta',90000,'manager','12/08/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (14,'vinay','kumar',902000,'developer','12/07/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (15,'Raj','dixit',90000,'developer','12/06/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (17,'sam','dicosta',900500,'manager','12/05/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (18,'zen','dipak',9500,'tester','12/04/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (19,'rohit','sharma',905000,'manager','12/10/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (110,'soni','sam',905000,'developer','12/01/2023')
insert into Employee(Id,Fname,Lname,Salary,Designation,DOJ) values (112,'arsh','Mana',920000,'developer','12/03/2023')
select * from Employee
select count(ID) from Employee where Designation='Developer'





create proc sp_DesgCount
@desig nvarchar(50),
@noe int output
as
select @noe=COUNT(Id) from Employee where Designation=@desig

declare @EmpCount int
execute sp_DesgCount 'Tester', @EmpCount output
print @EmpCount
-----------------------------------------------------------------------

execute sp_helptext 'sp_DesgCount'

alter proc sp_DesgCount
@desig nvarchar(50),
@neo int output
with encryption
as
select @neo = count(Id) from Emps where Designation=@desig
