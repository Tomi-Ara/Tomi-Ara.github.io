	CREATE DATABASE Employee_ID

--Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT*
FROM [dbo].[Employee_Details$]
WHERE Managerid = 986

--Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT DISTINCT Project
FROM [dbo].[Employee_Salary$]

--Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT COUNT(*) AS EmployeeCount
FROM [dbo].[Employee_Salary$]
WHERE Project='P1'

--Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT
MAX(Salary) AS max_salary,
MIN(Salary) AS min_salary,
AVG(Salary) AS avg_salary
FROM[dbo].[Employee_Salary$]

--Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT Empid
FROM [dbo].[Employee_Salary$]
WHERE Salary BETWEEN 9000 AND 15000

--Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT*
FROM [dbo].[Employee_Details$]
WHERE City='Toronto' 
AND Managerid=321

--Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT*
FROM[dbo].[Employee_Details$]
WHERE City='California' OR ManagerId=321

--Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT*
FROM [dbo].[Employee_Salary$]
WHERE Project NOT IN ('P1')

--Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT Empid, (Salary+Variable) AS TotalSalary
FROM [dbo].[Employee_Salary$]

--Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
SELECT*
FROM[dbo].[Employee_Details$]
WHERE FullName LIKE '__hn%'

--Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
SELECT EmpId
FROM[dbo].[Employee_Details$]
UNION
SELECT EmpId
FROM[dbo].[Employee_Salary$]

