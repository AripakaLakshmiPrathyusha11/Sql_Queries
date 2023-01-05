create database employee;
use employee;
create table emp(
empid int primary key,
empname varchar(100),
department varchar(50),
contactno bigint, 
emaildid varchar(100), 
empheadid int
);
insert into emp values(1,'Kelvin','IT',2345678910,'kelvin45@gmail.com',121);
insert into emp values(2,'Maxi','DS',2351890640,'maxi5@gmail.com',122);
insert into emp values(3,'Ira','CSE',134567890,'ira@gmail.com',123);
insert into emp values(4,'Celvin','CSE',1248764555,'celvin1@gmail.com',124);
insert into emp values(5,'Jack','IT',3690742156,'jack@gmail.com',125);
insert into emp values(6,'Emma','DS',2345678910,'kelvin45@gmail.com',126);
insert into emp values(7,'Wreck','IT',2498705421,'wreck@gmail.com',127);
insert into emp values(8,'David','CSE',3675432098,'david09@gmail.com',128);
insert into emp values(9,'Mark','DS',24109642765,'mark8@gmail.com',129);
insert into emp values(10,'Elen','IT',3586215301,'elen11@gmail.com',130);
insert into emp values(11,'Diana','CSE',2113065537,'dianach@gmail.com',131);
insert into emp values(12,'Christi','CSE',8765432109,'christi@yahoo.com',131);
insert into emp values(13,'Slatter','CSE',2340987767,'slatter@yahoo.com',123);
insert into emp values(14,'Ariyana','IT',34509861111,'ariyanas@yahoo.com',124);
insert into emp values(15,'Daisy','DS',3336678901,'daisyyy@yahoo.com',123);


select * from emp;

# b) 
use employee;
create table empdept(
deptid varchar(50) primary key,
deptname varchar(100), 
dept_off varchar(100), 
depthead int
);
desc empdept;
Alter table empdept Modify depthead varchar(20);
insert into empdept values('IT01','IT','Guntur','GNT');
insert into empdept values('IT02','IT','Vijayawada','VIJ');
insert into empdept values('IT03','IT','Secundradab','SEC');
insert into empdept values('DS01','DS','Pune','Pune');
insert into empdept values('DS02','DS','Vizag','VIZ');
insert into empdept values('DS03','DS','Guntur','GNT');
insert into empdept values('DS04','DS','Banglore','BANGLORE');
insert into empdept values('CSE01','CSE','Hyderabad','HYD');
insert into empdept values('CSE02','CSE','Ligampally','HYD');
insert into empdept values('CSE03','CSE','Arundelpeta','GNT');
insert into empdept values('CSE04','CSE','Manikonda','HYD');

select * from empdept;

# c)

create table empsalary(
empid int, 
salary bigint, 
ispermanent varchar(3),
FOREIGN KEY(empid) REFERENCES emp(empid)
);
desc empsalary;

insert into empsalary values(1,70000,'Yes');
insert into empsalary values(2,42000,'Yes');
insert into empsalary values(3,53000,'No');
insert into empsalary values(4,60000,'No');
insert into empsalary values(5,50000,'No');
insert into empsalary values(6,78000,'Yes');
insert into empsalary values(7,58000,'Yes');
insert into empsalary values(8,34000,'No');
insert into empsalary values(9,43000,'No');
insert into empsalary values(10,67000,'Yes');
insert into empsalary values(11,64000,'Yes');
insert into empsalary values(12,43000,'No');
insert into empsalary values(13,43000,'No');
insert into empsalary values(14,43000,'No');
insert into empsalary values(15,43000,'No');
insert into empsalary values(16,43000,'Yes');


select * from empsalary;

# 2)a) Select the detail of the employee whose name start with P.(hint use like)
select empname from emp where empname like 'p';

# b) How many permanent candidates earn more than 5000
##select salary,ispermanent from empsalary where salary>5000 and ispermanent = 'yes';
select sum(ispermanent='yes') as total from empsalary where salary >50000;

#c)Select the details of the employee whose emailId is in gmail
select * from emp where emaildid  like '%gmail%';

# 3) a) What is the total salary that is paid to permanent employees?
select salary,ispermanent from empsalary where ispermanent='Yes'; 

# b) List name of all employees whose name ends with a.\
select empname from emp where empname like '%a';

# 4) Nested Queries
# a) Select the name of the employee who is working under Abhishek.
# b) Select the name of the employee head who is permanent.

# 5) Joins Select all details and apply the following 
# a) left join on above any 2 tables emp
select * from emp LEFT JOIN empdept ON emp.department = empdept.deptname ;
#b) right join on above any 2 tables
select * from emp right join empsalary on emp.empid = empsalary.empid; 
# c) inner join on above any 2 tables
select * from emp inner join empsalary on emp.empid = empsalary.empid; 
#d) cross join on above any 2 tables
select * from emp cross join empdept on emp.empheadid = empdept.depthead;
# e)observe the difference in each join and explain all of them in your own words
left join : The LEFT JOIN  returns all the records from the left table and also those records which satisfy a condition from the right table. 
           Also, for the records having no matching values in the right table, the output or the result-set will contain the NULL values.
right join : The RIGHT JOIN returns all the records from the right table and also those records which satisfy a condition from the left table.
             Also, for the records having no matching values in the left table, the output or the result-set will contain the NULL values.
inner join : This type of join returns those records which have matching values in both tables. 
             So, if you perform an INNER join operation between the emp table and the empsalary table,
             all the tuples which have matching values in both the tables will be given as output.
cross join : After performing the cross join operation, the total number of rows present 
              in the final table will be equal to the product of the number of rows present in table 1 and
              the number of rows present in table empdept.

#6) Update a value in the employee table.
UPDATE emp SET empname = 'Maria' WHERE empid = 10;
    
    
select * from emp where empid = 10;


# 7)Delete the entire row in employee table where empid is 10;
SET = 0
 DELETE FROM  emp Where  empid = '10';
 select * from emp;
 
 # 8)altering table 
 #a) adding additional column in employee table
 ALTER TABLE employee.emp
Add Address varchar(500) NOT NULL;
# b) removing the newly added column from employee table
ALTER TABLE employee.emp Drop Address;

# 9) Find the count of common salaries given to the employees (hint use group by)
select  empid,avg(salary) as average_salary,count(*) from empsalary  group by empid having count(*)=34000;

# 10) ) lists the number of employees and there common salary, sorted high to low
#(Only include common salary with more than 5 employees)
SELECT * FROM empsalary  ORDER BY salary ;

# 11) Explain about the JOINS.
JOINS in SQL are commands which are used to combine rows from two or more tables, based on a related column between those tables.  
There are predominantly used when a user is trying to extract data from tables which have one-to-many or many-to-many relationships between them.

#12)What are UNION, MINUS and INTERSECT commands?
UNION merges the results of two SELECT statements.  UNION statements only return UNIQUE values.
MINUS set operator we are able to see only those that occur in the first table and are not present in the second.
INTERSECT set operator used to get only common elements that are present in first and second table.