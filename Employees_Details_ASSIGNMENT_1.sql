CREATE DATABASE Employee_DB;
USE Employee_DB;
CREATE TABLE Departments(
Department_ID INT,
Department_Name varchar(100)
);
CREATE TABLE Locations(
Location_ID INT,
Location varchar(30)
);
CREATE TABLE Employees_Details(
Employee_ID INT auto_increment primary key,
Employee_Name varchar(50) unique,
Gender enum("M","F"),
Age INT,
Hire_Date date,
Designation varchar(100),
Department_ID int,
Location_ID int,
Salary decimal(10,2)
);

---  ALTER TABLE -- ADD NEW COLUMNS
ALTER TABLE Employees_Details
ADD (Email varchar(50) NOT NULL
);

---- ALTER TABLE --- MODIFY COLUMNS
ALTER TABLE Employees_Details
modify Designation varchar(200);

----- ALTER TABLE--- DROP COLUMNS
ALTER TABLE Employees_Details
DROP Age;


------ ALTER TABLE ----- RENAME COLUMNS
ALTER TABLE  Employees_Details
RENAME column Hire_Date TO Date_Of_Joining;

--- RENAME TABLE
RENAME TABLE Departments TO Departments_INFO;

RENAME TABLE Locations TO Locations_Details;

--- TRUNCATE TABLE

TRUNCATE TABLE Employees_Details;

--- DROP TABLE


DROP TABLE Location;
---- INSERT DEPARTMENT NAME ID --
insert into Departments_INFO
(Department_ID, Department_Name)
values
(4002,"IT"),(8901,"Sales"),(2281,"Marketing"),(8902,"Sales"),(2282,"Marketing"),
(8903,"Sales"),(4001,"IT"),(3170,"HR"),(4003,"IT"),(8903,"Sales");

select*from Departments_INFO;

--- INSEART LOCATION NAME AND ID 

insert into Locations_Details(Location_ID, Location)
values
(400001,"Mumbai"),(380001,"Ahmedabad"),(600001,"Chennai"),(560001,"Bengaluru"),(700001,"Kolkata"),
(302001,"Jaipur"),(500001,"Hyderabad"),(226001,"Lucknow"),(800001,"Patna"),(462001,"Bhopal");

select*from Locations_Details;

insert into Employees_Details
(Employee_ID,Employee_Name,Gender,Date_Of_Joining,Designation,Department_ID,Location_ID,Salary,Email)
values
(101,"Arun","M","2023-10-23","Software Engineer",4002,400001,35000,"arun@gmail.com"),
(102,"Priya","F","2016-01-05","Sales Representative",8901,380001,40000,"priya@gmail.com"),
(103,"Karthik","M","2017-04-20","Marketing Coordinator",2281,600001,45000,"karthik@gmail.com"),
(104,"Ashwin","M","2025-08-19","Account Manager",8902,560001,60000,"ashwin@gmail.com"),
(105,"Meena","F","2019-02-21","Marketing Assistant",2282,700001,50000,"meena@gmail.com"),
(106,"Divya","F","2026-03-22","Sales Manager",8903,302001,55000,"divya@gmail.com"),
(107,"Maddy","M","2016-09-23","Full-Stack Developer",4001,500001,70000,"maddy@gmail.com"),
(108,"Anu","F","2019-04-17","HR Coordinator",3170,226001,100000,"anu@gmail.com"),
(109,"Vijya","F","2019-02-25","Data Analyst",4003,800001,550000,"vijya@gmail.com"),
(110,"Lakshmi","F","2015-09-16","Sales Executive",8903,462001, 40000,"lakshmi@gmail.com");

select*from Employees_Details;




















