--Create table customer
create table Cust(
c_id int primary key identity(1,1),
cust_name varchar(20),
city varchar(20),
grade int,
)
ALTER TABLE Cust DROP Column grade

ALTER TABLE Cust
ADD grade varchar(20)


select * from Cust



insert into Cust values('Mohini','Nashik','A')
insert into Cust values('Rajesh','Mumbai','B')
insert into Cust values('Sachin','pune','A')
insert into Cust values('Pranav','nagpur','B')
insert into Cust values('Savita','Nashik','A')
insert into Cust values('Dipali','Mumbai','C')



--Salesman table
create table Salesman2(
saleman_id int primary key identity(1,1),
S_name varchar(20),
S_city varchar(20),
S_commision numeric,
)

insert into Salesman2 values('Nitesh','Mumbai',300)
insert into Salesman2 values('Riyansh','Nashik',100)
insert into Salesman2 values('Rajshri','Mumbai',200)
insert into Salesman2 values('Priti','Pune',500)
insert into Salesman2 values('Gitesh','Mumbai',100)
insert into Salesman2 values('Vedant','Pune',1000)

select * from Salesman2


--Create tablefor order
create table Orders1(
o_id int primary key identity(1,1),
Pur_Amount numeric,
O_date date,
)

select * from Orders1

insert into Orders1 values(800,getdate())
insert into Orders1 values(500,getdate())
insert into Orders1 values(800,getdate())
insert into Orders1 values(400,getdate())
insert into Orders1 values(800,getdate())
insert into Orders1 values(700,getdate())

--alter table Order1 add constraint pk_Customer1 primary key(c_id) and pk_Saleman primary key(saleman_id)
alter table Orders1 add c_id int
alter table Orders1 add saleman_id int

--Add Foreign key in Order1 table 
alter table Orders1
add foreign key (c_id) references Cust(c_id)

--Add Foreign key in Order1 table 
alter table Orders1
add foreign key (saleman_id) references Salesman2(saleman_id)

--add column in cust for Sales id
alter table Cust add saleman_id int

--Add Foreign key in Cust table 
alter table Cust
add foreign key (c_id) references Cust(c_id)


select * from Orders1
--insert saleman id
update Orders1 set saleman_id=1 where o_id=1
update Orders1 set saleman_id=2 where o_id=2
update Orders1 set saleman_id=3 where o_id=3
update Orders1 set saleman_id=4 where o_id=4
update Orders1 set saleman_id=5 where o_id=5
update Orders1 set saleman_id=6 where o_id=6

--1.Inner Join
select s.S_name,s.saleman_id,s.S_city,s.S_commision
from Salesman2 s
inner join Orders1 o on  o.o_id=s.saleman_id

--2.Inner Join with where clause display data of sales man where saleman city is mumbai
select s.S_name,s.saleman_id,s.S_city,s.S_commision
from Salesman2 s
inner join Orders1 o on  o.o_id=s.saleman_id
where s.S_city='Mumbai'

--3.Inner Join with where clause display data of Order where Customerid=5
select o.o_id,o.O_date,o.Pur_Amount
from Orders1 o
inner join Cust c on  o.o_id=c.c_id
where c.c_id=5

--4.left Join   return all record from left table and matches data from right table
select c.c_id,c.cust_name,c.grade
from Cust c
left join Orders1 o on  o.o_id=c.c_id
where c.c_id=5

--5.right Join   return all record from right table and matches data from left table
select c.c_id,c.cust_name,c.grade
from Cust c
right join Salesman2 s on  s.saleman_id=c.c_id
where c.c_id=3

--6.full Join   return all record from right table and matches data from left table
select c.c_id,c.cust_name,c.grade
from Cust c
full join Salesman2 s on  s.saleman_id=c.c_id
where c.c_id=6

--7. find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city
select c.c_id,c.cust_name,c.city,s.S_name
from Cust c
inner join Salesman2 s on s.saleman_id=c.c_id
where s.S_city=c.city

--8.find those orders where order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select o.o_id,o.Pur_Amount,c.cust_name,c.city
from Orders1 o
inner join Cust c on o.o_id=c.c_id
where o.Pur_Amount between 500 and 2000

--9.find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade,Salesman name,commision
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id

--10.query to display the cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending on customer_id.
select c.c_id,c.cust_name,c.city,c.grade,s.S_name,s.S_city
from Cust c
inner join Salesman2 s on c.c_id=s.saleman_id
order by c.c_id

--11. find those customers whose grade less than B. and display all information of order and saleman
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id
where c.grade<'B'

--12.find those customers whose grade is A. and display all information of order and saleman
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id
where o.Pur_Amount<=1000

--13.Display Customer information in Desc order 
select c.c_id,cust_name,c.grade
from Cust c
order by c.cust_name Desc

--14.create report with customer name, city, order number, order date, and order amount in ascending order
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id
order by o.Pur_Amount

--15. find those Saleman whose Commision is greater than 1000. and display all information of order and saleman
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id
where s.S_commision>=1000

--16.write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,c.city,S_name as Salesperson,s.S_commision,s.S_city
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id

--17.Inner Join with where clause display data of sales man where saleman city is mumbai and Customer city is pune
select s.S_name,s.saleman_id,s.S_city as SalesMan_City,s.S_commision,c.cust_name,c.city as Cust_City
from Salesman2 s
inner join Orders1 o on  o.o_id=s.saleman_id
inner join Cust c on o.o_id=c.c_id
where s.S_city='Mumbai' and c.city='pune'

--18.perform cross join with customer,saleman,and order table
select c.c_id,c.cust_name,c.city,c.grade,s.saleman_id,s.S_name,s.S_commision
from Cust c
inner join Salesman2 s on  s.saleman_id=c.c_id
cross join Orders1

--19.display Customer & Saleman ascending order of name of saleman and commision
select c.cust_name,c.city,c.grade
from Cust c
inner join Salesman2 s on s.saleman_id=c.c_id
order by s.S_name,s.S_commision 

--20.write a SQL query to find those salespersons who customer name is sachin
select o.o_id,o.Pur_Amount,o.O_date,c.cust_name,c.grade,s.S_name,s.S_commision
from Orders1 o 
inner join Cust c on o.o_id=c.c_id
inner join Salesman2 s on o.o_id=s.saleman_id
where c.cust_name='sachin'