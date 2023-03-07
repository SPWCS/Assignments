-- 1.Write SQL command to create a database named hremployeeDB and a table named HR_Employee with columns for EmployeeID, Department, JobRole, 
-- Attrition, Gender, Age, MaritalStatus, Education, EducationField, BusinessTravel, JobInvolvement, JobLevel, JobSatisfaction, Hourlyrate, Income, Salaryhike,
-- OverTime, Workex, YearsSinceLastPromotion, EmpSatisfaction, TrainingTimesLastYear, WorkLifeBalance, Performance_Rating, and set EmployeeID as the primary key

create database hremployeeDB;

use hremployeeDB;
drop table hr_employee;

create table hr_employee(
EmployeeID int not null ,Department varchar(20),JobRole varchar(20), Attrition varchar(20),
Gender varchar(20), Age int,MaritalStatus varchar(20), Education varchar(20),
 EducationField varchar(20), BusinessTravel varchar(20), JobInvolvement varchar(20), JobLevel int,
 JobSatisfaction varchar(20), Hourlyrate int, Income int, Salaryhike int, OverTime int,
 Workex int, YearsSinceLastPromotion int, EmpSatisfaction varchar(20), TrainingTimesLastYear int,
 WorkLifeBalance varchar(20), Performance_Rating varchar(20), primary key(EmployeeID));
 
drop table hr_employee;

-- 2.Return the shape of the table
select * from hr_employee;

-- 3.Show the count of Employee & percentage Workforce in each Department.
select count(*) as no_of_employee,department,count(*) * 100/sum(count(*)) over() as 'Percentage' from hr_employee group by department;

-- 4.Which gender have higher strength as workforce in each department?
select gender,count(gender) as total_no,department from hr_employee group by gender,department order by total_no desc limit 3;

-- 5.Show the workforce in each Job Role
select jobrole,count(*) as total_no from hr_employee group by jobrole;

-- 6.Show Distribution of Employee's Age Group.
alter table hr_employee add column age_group varchar(20);
set sql_safe_updates = 0;
update hr_employee set age_group= if (age <= 20, '<20' , if(age>35 ,'35+' , '20-35')); 
select age_group,count(*) as emp_num from hr_employee group by age_group; 

-- 7.Compare all marital status of employee and find the most frequent marital status.  --
select maritalstatus,count(maritalstatus) as no_of_emp from hr_employee group by maritalstatus;

-- 8.What is Job satisfaction level of employee?
select JobSatisfaction,count(JobSatisfaction) as no_of_emp_satisfied from hr_employee group by JobSatisfaction;

-- 9.How frequently employee is going on Business Trip
select businesstravel,count(businesstravel) as no_of_emp from hr_employee group by businesstravel;

-- 10.Show the Department with Highest Attrition Rate (Percentage)
select department,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by department order by percentage desc limit 1;

-- 11.Show the Job Role with Highest Attrition Rate (Percentage)
select jobrole,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by jobrole order by percentage desc limit 1;

-- 12.Show Distribution of Employee's Promotion, Find the maximum chances of employee getting promoted.

-- 13.Find the Attrition Rate for Marital Status.
select maritalstatus,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by maritalstatus;

-- 14.Find the Attrition Count & Percentage for Different Education Levels
select education,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by education;

-- 15.Find the Attrition & Percentage Attrition for Business Travel.
select businesstravel,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by businesstravel;

-- 16.Find the Attrition & Percentage Attrition for Various JobInvolvement
select jobinvolvement,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by jobinvolvement;

-- 17.Show Attrition Rate for Different JobSatisfaction
select jobsatisfaction,count(*) as no_of_attrition,
count(*) * 100/sum(count(*)) over() as 'Percentage' 
from hr_employee where attrition='yes' group by jobsatisfaction;

-- 

