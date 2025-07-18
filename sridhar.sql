create database salary;
use salary;

create table salary_data(
	Age_Range varchar(20),
	Industry varchar(100),
	Job_Title varchar(100),
	Annual_Salary int,
	Additional_Monetary_Compensation int,
	Currency varchar(10),
	Country varchar(100),
	City varchar(100),
	Years_of_Professional_Experience_Overall varchar (100),
	Years_of_Professional_Experience_in_Field varchar(100),
	Education varchar(100),
    Gender varchar(50));

select * from salary_data;


#1. Average Salary by Industry and Gender
SELECT Industry,Gender,AVG(Annual_Salary) AS Avg_Salary
FROM salary_data GROUP BY Industry, Gender  ;

#2.Total Salary Compensation by Job Title
SELECT Job_Title,SUM(Annual_Salary + Additional_Monetary_Compensation) AS Total_Compensation
FROM salary_data GROUP BY Job_Title ;

#3. Salary Distribution by Education Level
SELECT Education,
    MIN(Annual_Salary) AS Min_Salary,
    MAX(Annual_Salary) AS Max_Salary,
    AVG(Annual_Salary) AS Avg_Salary
FROM salary_data GROUP BY Education;

#4.Employees by Industry and Experience
SELECT Industry,Years_of_Professional_Experience_Overall,COUNT(*) AS Num_Employees
FROM salary_data GROUP BY Industry, Years_of_Professional_Experience_Overall;

#5. Median Salary by Age Range and Gender
select Age_Range,Gender,avg(Annual_Salary) as Salary from salary_data group by Gender,Age_Range order by Age_Range;

#6. Highest Salary Job Title in Each Country
SELECT s.Country,s.Job_Title,s.Annual_Salary
FROM salary_data s
JOIN (SELECT Country, MAX(Annual_Salary) AS Max_Salary
FROM salary_data GROUP BY Country) max_salaries
ON s.Country = max_salaries.Country AND s.Annual_Salary = max_salaries.Max_Salary;

#7. Average Salary by City and Industry
SELECT City,Industry,AVG(Annual_Salary) AS Avg_City_Salary
FROM salary_data GROUP BY City, Industry;

#8. Percentage of Employees with Additional Compensation by Gender
SELECT Gender,ROUND(COUNT(CASE WHEN Additional_Monetary_Compensation > 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS Percentage_With_Bonus
FROM salary_data GROUP BY Gender;

#9. Total Compensation by Job Title and Experience
SELECT Job_Title,Years_of_Professional_Experience_Overall,SUM(Annual_Salary + Additional_Monetary_Compensation) AS Total_Comp
FROM salary_data GROUP BY Job_Title, Years_of_Professional_Experience_Overall;

#10. Average Salary by Industry, Gender, and Education Level
SELECT Industry,Gender,Education,AVG(Annual_Salary) AS Avg_Salary
FROM salary_data GROUP BY Industry, Gender, Education;