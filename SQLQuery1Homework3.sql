create table Custm1( 
city varchar(20),
country varchar(20),
)

insert into Custm1 values('mumbai','india')
insert into Custm1 values('delhi','india')
insert into Custm1 values('berlin','norway')
insert into Custm1 values('oxford','Uk')
insert into Custm1 values('oslo','france')
insert into Custm1 values('pune','india')
insert into Custm1 values('nashik','india')
insert into Custm1 values('london','Uk')
insert into Custm1 values('pune','india')
insert into Custm1 values('Thane','india')

create table supplier(
city varchar(10),
country varchar(10),
)
insert into supplier values('Thane','india')
insert into supplier values('vashi','india')
insert into supplier values('uri','norway')
insert into supplier values('oxford','Uk')
insert into supplier values('nagasaki','france')
insert into supplier values('pune','india')
insert into supplier values('kharghar','india')
insert into supplier values('woshington','Uk')
insert into Custm1 values('Thane','india')

--Unioun and union all

select city, country from Custm1 where city='Pune'
union
select city, country from Custm1 where city='Pune'

select city, country from Custm1 where city='Pune'
union all
select city, country from Custm1 where city='Pune'

select city, country from Custm1 where city='Thane'
union
select city, country from Custm1 where city='Thane'
select city, country from Custm1 where city='Thane'
union all
select city, country from Custm1 where city='Thane'