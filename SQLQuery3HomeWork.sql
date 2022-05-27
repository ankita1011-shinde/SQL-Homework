Create table Customers(
CustomerId int primary key identity(1,1),
Name varchar(20),
City varchar(20),
Price int,
Postalcode int,
Country varchar(20),
)

Select *from Customers

insert into Customers values('John','London',20,123421,'UK')
insert into Customers values('mariya','Berlin',30,121110,'germany')
insert into Customers values('Rock','Noida',20,122343,'Norway')
insert into Customers values('John','London',190,112231,'UK')
insert into Customers values('Olive','Oslo',35,null,'Norway')
insert into Customers values('Harry','Oxford',20,123111,'UK')
insert into Customers values('reeta','Annecy',60,null,'France')
insert into Customers values('Roohi','London',100,100233,'Norway')
insert into Customers values('David','Berlin',40,123341,'germany')
insert into Customers values('Jennei','York',65,112343,'UK')
insert into Customers values('Jennei','Avignon',154,112343,'France')
insert into Customers values('Jennei','Hamar',48,112343,'Norway')

--1]
Select City from Customers

--2]
Select distinct Country from Customers

--3]
Select * from Customers where  City='London'

--4]
Select * from Customers where not City='Berlin'

--5]
Select * from Customers where  CustomerId=23

--6]
Select * from Customers where City='Berlin' and Postalcode=121110

--7]
Select * from Customers where City='Berlin' or City='London'

--8]
Select * from Customers order by City

--9]
Select * from Customers order by City desc

--11]
Select * from Customers where Postalcode is null

--10]
Select *from Customers order by Name,Country
--12]
Select * from Customers where Postalcode is not null

--13]
Update Customers set City='Oslo' where Country='Norway'
--14]
delete from Customers where Country ='Norway'
--15]
Select min(Price) as SmallestValue from Customers

--16]
Select max(Price) as HighestValue from Customers

--17]
Select * from Customers where  Price=20

--18]
Select avg(Price) as AvgPrice from Customers

--19]

--20]
Select * from Customers where City like 'a%'

--21]
Select * from Customers where City like '%a'

--22]
Select * from Customers where City like '%a%'

--23]
Select * from Customers where City like '[a-b]'

--24]


