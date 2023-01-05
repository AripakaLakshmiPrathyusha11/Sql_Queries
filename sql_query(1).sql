# 1. Create a student table with the student id, name, and marks as
# attributes where the student id is the primary key.
create database student;
use student; 
create table infost(
studentid tinyint ,
name varchar(20),
marks smallint,
constraint pk_key primary key (studentid)
);

desc infost;

## 2. Insert the details of a new student in the above table
insert into infost values(1,'Sweety',90);
insert into infost values(2,'prathyu',87);
select * from infost;

## 3. Delete the detail of a student in the above table.
Delete from infost;

## 4. Insert more records to the above student table more than 7.

insert into infost values(1,'kiran',80);
insert into infost values(2,'sweety',79);
insert into infost values(3,'siva',87);
insert into infost values(4,'sreeja',90);
insert into infost values(5,'bhanu',88);
insert into infost values(6,'dhanush',82);
insert into infost values(7,'chetana',65);
insert into infost values(8,'dheeraj',49);
insert into infost values(9,'sai',97);
insert into infost values(10,'nani',89);
insert into infost values(11,'padma',92);

select * from infost;

# 5.Use the select command to get the details of the students with marks more than 80.

select * from infost where marks >80;

# 6.Find the min, max, sum, and average of the marks in a student marks table.

select min(marks) as minimum,max(marks) as maximum,sum(marks) as total,avg(marks) as average from  infost;

# 7.Find the student names whose marks are greater than 60 and less than 40.
select name,marks from infost where marks>60 and marks<40;

# 8. Write a SQL query to order the (student ID, marks) table in descending order of the marks

select studentid,marks from infost order by 2 desc;

# 9. Write a SQL query to display the marks without decimal places,display the remainder after dividing marks by 3 and display the square of marks.

select round(marks,0),mod(marks,3),pow(marks,2) from infost;

# 10. Write a SQL query to display names into capital letters, small letters,display first 3 letters of name, display last 3 letters of name, displaythe position the letter A in name.

select ucase(name),lcase(name),left(name,3),right(name,3),instr(name,'a') from infost;

# Additional Questions :
# 11. Remove extra spaces from left, right and both sides from the text – ”Innomatics Research Lab 
select ltrim("       Innomatics Research Lab      ") "Left Spaces", rtrim("            Innomatics Research Lab         ") "Right Trim", trim("       Innomatics Research Lab      ");

# 12.Display today’s date in “Date/Month/Year” format.

select concat(date(now()),concat("/",concat(month(now()),concat("/",year(now())))));

#13.Display dayname, monthname, day, dayname, day of month, day of year for today’s date.

select dayname(now()),monthname(now()),day(now()),dayname(now()),dayofmonth(now()),dayofyear(now());

# 14. Explain the difference between primary key and foriegn key.
PRIMARY KEY	
1.A primary key is used to ensure data in the specific column is unique.	
2.It uniquely identifies a record in the relational database table.	
3.Only one primary key is allowed in a table.	
4.It does not allow NULL values.	
5.It constraint can be implicitly defined on the temporary tables.	

FOREIGN KEY
1. A foreign key is a column or group of columns in a relational database table that provides a link between data in two tables.
2. It refers to the field in a table which is the primary key of another table.
3. Whereas more than one foreign key are allowed in a table.
4. It can also contain NULL values.
5. It constraint cannot be defined on the local or global temporary tables.