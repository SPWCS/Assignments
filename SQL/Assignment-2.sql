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
SELECT CASE WHEN YearsSinceLastPromotion >= 2 AND joblevel <= 2 THEN 'high'
            WHEN YearsSinceLastPromotion >= 5 AND joblevel <= 5 THEN 'medium'
            ELSE 'low'
       END AS promotion_chances,
       COUNT(*) AS num_employees,
       ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee) * 100, 2) AS promotion_rate
FROM hr_employee
GROUP BY promotion_chances
ORDER BY num_employees DESC;

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

-- 18.key reasons for Attrition in Company.
select * from (SELECT concat('JobRole: ',JobRole) as key_reason , 
       ROUND(COUNT(CASE WHEN Attrition like 'YES' THEN 1 END) / COUNT(*) * 100, 2) AS attrition_rate 
FROM hr_employee 
GROUP BY JobRole
order by attrition_rate desc limit 1) as first
union
select * from
(select concat('MaritalStatus: ',MaritalStatus) as key_reason,ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee where Attrition like 'Y%') * 100, 2) AS attrition_rate 
from hr_employee where Attrition like 'Y%' group by MaritalStatus
order by attrition_rate desc limit 1) as second
union
select * from(select concat('Education: ',Education) as key_reason, ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee where Attrition like 'Y%') * 100, 2) AS attrition_rate 
from hr_employee 
where Attrition like 'Y%'
group by Education
order by attrition_rate desc limit 1) as third
union
select * from(
select concat('BusinessTravel: ',BusinessTravel) as key_reason, ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee where Attrition like 'Y%') * 100, 2) AS Travel_rate
from hr_employee 
where Attrition like 'Y%'
group by BusinessTravel
order by Travel_rate desc limit 1) as fourth
union
select * from(
select concat('JobInvolvement: ',JobInvolvement) as key_reason, ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee where Attrition like 'Y%') * 100, 2) AS JobInvovlement_rate
from hr_employee 
where Attrition like 'Y%'
group by JobInvolvement
order by JobInvovlement_rate desc limit 1
)as five
union 
select * from(
select concat('JobSatisfaction: ',JobSatisfaction) as key_reason, ROUND(COUNT(*) / (SELECT COUNT(*) FROM hr_employee where Attrition like 'Y%') * 100, 2) AS attrition_rate 
from hr_employee 
where Attrition like 'Y%'
group by JobSatisfaction
order by attrition_rate desc limit 1) as six
order by attrition_rate desc limit 5;



-- 19.Return all employee where WorkEx greater than 10,
-- provided that they travel frequently, WorkLifeBalance as Good and JobSatisfaction is Very High.

select * from hr_employee where workex > 10 and BusinessTravel like '%frequent%' and worklifebalance='Good' and jobsatisfaction='very high' ;

-- 20.Write query to display who has better WorkLifeBalance ,
-- Married, Single or Divorced provided that Performace_Rating is Outstanding. 

select distinct worklifebalance from hr_employee;
select maritalstatus, count(*) as BetterWorkLifeBalanceCount
from hr_employee
where worklifebalance='Better' and performance_rating='Outstanding'
group by maritalstatus
order by BetterWorkLifeBalanceCount desc;

