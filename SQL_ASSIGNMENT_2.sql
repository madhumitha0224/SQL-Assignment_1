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

# Distinct Values: a query to retrieve distinct salaries from the Employees table.

select distinct Salary from Employees_Details;

ALTER TABLE Employees_Details
ADD column Age varchar (10);

select*from Employees_Details;

ALTER TABLE Employees_Details
DROP Age;

ALTER TABLE Employees_Details
ADD column Age int;

select*from Employees_Details;

update Employees_Details set Age = 30 where Employee_ID = 101;
update Employees_Details set Age = 25 where Employee_ID = 102;
update Employees_Details set Age = 46 where Employee_ID = 103;
update Employees_Details set Age = 23 where Employee_ID = 104;
update Employees_Details set Age = 26 where Employee_ID = 105;
update Employees_Details set Age = 28 where Employee_ID = 106;
update Employees_Details set Age = 25 where Employee_ID = 107;
update Employees_Details set Age = 24 where Employee_ID = 108;
update Employees_Details set Age = 33 where Employee_ID = 109;
update Employees_Details set Age = 42 where Employee_ID = 110;

select*from Employees_Details;

# Rename the Age and salary USE AS

select Age As Employee_Age, Salary AS Employee_Salary
from Employees_Details;

# Using WHERe_Clause (GREATER THAN)

select*from Employees_Details where Salary > 50000;

# Using WHERe_Clause (LESS THAN)

select*from Employees_Details where Salary < 50000;

# Using a (IS null)

select*from Employees_Details where Designation IS null;

# No null values

# Using a ORDER BY 
-- department ID in ascending order and descending order.

select*from Employees_Details order by Department_ID;

select*from Employees_Details order by Department_ID desc;

-- salary in ascending order and descending order.

select*from Employees_Details order by Salary;

select*from Employees_Details order by Department_ID desc;

# LIMIT: Display the first 5 employees hired in the year 2018.

select*from Employees_Details where Date_Of_Joining < 2020;

# sum of all salaries in the Finance department.

select sum(Salary) AS Total_Salary from Employees_Details;

# Find the minimum age among all employees.

select min(Age) AS Employees_Age from Employees_Details;

# List the maximum salary for each location.

select Location_ID,max(Salary) AS Maximum_Salary from Employees_Details group by Location_ID;

# average salary for each designation containing the word 'Analyst'.,'MALE','FEMALE'

select Designation,avg(Salary) AS Average_Salary from Employees_Details where Designation like 'Data Analyst' GROUP BY Designation;

select Gender,avg(Salary) AS Average_Salary from Employees_Details where Gender like 'M' GROUP BY Gender;

select Gender,avg(Salary) AS Average_Salary from Employees_Details where Gender like 'F' GROUP BY Gender;

select*from employees_details;

# HAVING: Find departments with less than 3 employees.

SELECT department_id, COUNT(*) AS employee_count from Employees_Details group by department_id having COUNT(*) < 3;

#----Find locations with female employees whose average age is below 30.

select Location, AVG(age) AS average_age from Employees_Details,locations_details where gender = 'F' group by Location having AVG(age) < 30;

###----Joins: 
# Inner Join: List employee names, their designations, and department names where employees are assigned to a department.

SELECT e.Employee_Name, e.Designation, d.Department_Name
FROM Employees_Details e
INNER JOIN Departments d ON e.Department_ID = d.Department_ID;



INSERT INTO departments (Department_ID, Department_Name) VALUES
(4002, 'Finance'),
(8901, 'Sales'),
(2281, 'Marketing'),
(3170, 'HR');

# 2. Left Join:
#---- List all departments along with the total number of employees in each department, including departments with no employees.

SELECT d.Department_Name, COUNT(e.Employee_ID) AS Total_Employees
FROM Departments d
LEFT JOIN Employees_Details e ON d.Department_ID = e.Department_ID
GROUP BY d.Department_ID, d.Department_Name;

# Right Join: Display all locations along with the names of employees assigned to each
# ---location. If no employees are assigned to a location, display NULL for employee name.

SELECT l.*, e.Employee_Name
FROM Employees_Details e
RIGHT JOIN Locations_Details l ON e.Location_ID = l.Location_ID;





