create table salesman(salesman_id int primary key ,Name varchar(50), city varchar(20), commission float);

insert into salesman (salesman_id  ,name , city , commission)
 value(5001,'james hoog','new york',0.15),
 (5002,'Nail Knite','Paris',0.13),
 (5005 ,' Pit Alex '  ,' London ', 0.11),
 ( 5006, 'Mc Lyon ', 'Paris ' ,0.14),
 (5007 ,'Paul Adam ',' Rome ', 0.13),
 (5003, 'Lauson Hen ','San Jose', 0.12);
 
 
 create table customer(customer_id int primary key, 
 cust_name varchar(50),
 city varchar(20),
 grade int ,
 salesman_id int,
 Foreign Key(salesman_id) References salesman(salesman_id));
 
 insert into customer (customer_id , cust_name, city ,grade ,salesman_id ) 
 value (3002 ,'Nick Rimando ',' New York ', 100 ,5001),
 (3007,' Brad Davis', 'New York ', 200 , 5001),
 ( 3005 ,'Graham Zusi ',' California', 200 ,5002),
 (3008 ,'Julian Green ','London ',300 ,5002),
 (3004, 'Fabian Johnson ',' Paris',  300 ,5006),
 (3009,'Geoff Cameron ','berlin', 100 ,5003),
 (3003,'Jozy Altidor',' Moscow ',200 ,5007),
 (3001,'Brad Guzan ','London',null, 5005);
 
 #https://www.w3resource.com/sql-exercises/sql-joins-exercises.php
 
 
 
 #question1 :From the following tables write a SQL query to find the salesperson and customer who reside in the same city.Return Salesman, cust_name and city. 
select salesman.name  ,customer.cust_name, customer.city
from salesman ,customer 
where salesman.city= customer.city;
 
 
 
 
 #question3.From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission. 
 select customer.cust_name, customer.city ,salesman.name, salesman.commission
 from customer inner join salesman
 on customer.salesman_id=salesman.salesman_id;
 
 
 
 
 #4.From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.   
 select c.cust_name as 'Customer Name', 
 c.city as 'Customer City',
 s.name as 'salesman',
 s.commission
 from customer c 
 inner join salesman s
 on c.salesman_id=s.salesman_id
 where s.commission > 0.12;
 
#5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
select c.cust_name as 'Customer Name',
c.city as 'Customer City',
s.name as 'Salesman',
s.city as 'Salesman City',
s.commission
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id
where s.city != c.city AND s.commission > 0.12;

select c.cust_name as 'Customer Name',
c.city as 'Customer City',
s.name as 'Salesman',
s.city as 'Salesman City',
s.commission
from salesman s
inner join customer c
on s.salesman_id=c.salesman_id
where (select salesman.city,customer.city from salesman,customer where salesman.city != customer.city) AND s.commission > 0.12;




