CREATE DATABASE Workplace_Safety_Data

--How many incidents occurred at each plant?
SELECT Plant, COUNT(*) AS Incidents_Count
FROM [dbo].['Workplace Safety Data$']
GROUP BY Plant

--What is the total incident cost per department?
SELECT Department, SUM([Incident Cost]) AS Total_Incident_Cost
FROM [dbo].['Workplace Safety Data$']
GROUP BY Department

--Which incident type resulted in the highest total days lost?
SELECT TOP(1) [Incident Type], SUM ([Days Lost]) AS Total_Days_Lost
FROM[dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY Total_Days_Lost DESC

--What is the distribution of incident types by shift?
SELECT Shift, [Incident Type], COUNT(*) AS Incident_Type_Count
FROM[dbo].['Workplace Safety Data$']
GROUP BY Shift, [Incident Type]
ORDER BY Shift, Incident_Type_Count DESC

--What is the average incident cost for each injury location?
SELECT [Injury Location], AVG([Incident Cost]) AS Average_Incident_Cost
FROM [dbo].['Workplace Safety Data$']
WHERE [Injury Location] != 'N/A'
GROUP BY [Injury Location]
ORDER BY Average_Incident_Cost DESC

--Which age group has the highest number of incidents?
SELECT TOP(1) [Age Group], COUNT(*) AS Incident_Count
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Age Group]
ORDER BY Incident_Count DESC

--How many incidents were reported as 'Lost Time' by each plant?
SELECT Plant, COUNT(*) AS Lost_Time_Incident_Count
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Lost Time'
GROUP BY Plant
ORDER BY Lost_Time_Incident_Count DESC

--Which department had the highest number of 'Crush & Pinch' incidents?
SELECT TOP(1) Department, COUNT (*) AS Highest_Crush_Pinch_Incidents
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY Department
ORDER BY Highest_Crush_Pinch_Incidents DESC

--Which plants reported the most "Near Miss" incidents?
SELECT TOP(1) Plant, COUNT(*) AS Most_Near_Miss
FROM[dbo].['Workplace Safety Data$']
WHERE [Report Type]= 'Near Miss'
GROUP BY Plant
ORDER BY Most_Near_Miss DESC

--What is the total number of incidents by year and month?
SELECT Year(Date) AS Year, Month(Date) AS Month, COUNT(*) AS Total_Incidents
FROM[dbo].['Workplace Safety Data$']
GROUP BY Year(Date), Month(Date)
ORDER BY Year ASC, Month ASC

--Which gender has the most reported incidents?
SELECT TOP(1) Gender, COUNT(*) AS Most_Reported_Incident_Gender
FROM[dbo].['Workplace Safety Data$']
GROUP BY Gender
ORDER BY Most_Reported_Incident_Gender DESC

--What is the total cost of incidents per year?
SELECT Year, SUM([Incident Cost]) AS Total_Cost
FROM[dbo].['Workplace Safety Data$']
GROUP BY Year
ORDER BY Year ASC

--Which incident resulted in the highest cost?
SELECT TOP(1) [Incident Type], [Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type], [Incident Cost]
ORDER BY [Incident Cost] DESC

--What is the total cost of incidents for each report type?
SELECT [Report Type] ,SUM([Incident Cost]) AS Total_Cost
FROM[dbo].['Workplace Safety Data$']
GROUP BY [Report Type]
ORDER BY Total_Cost DESC

--Which departments had incidents with more than 2 days lost?
SELECT Department, COUNT(*) AS More_than_2_Days_Lost
FROM[dbo].['Workplace Safety Data$']
WHERE [Days Lost] >2
GROUP BY  Department
ORDER BY More_than_2_Days_Lost DESC

--What is the average number of days lost per incident type?
SELECT [Incident Type], AVG([Days Lost]) AS Average_Number_Days_Lost
FROM[dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY Average_Number_Days_Lost DESC

--What is the distribution of incidents by shift (Day, Afternoon, Night)?
SELECT Shift, COUNT(*) AS Incidents_Count
FROM[dbo].['Workplace Safety Data$']
GROUP BY Shift
ORDER BY Incidents_Count DESC

--Which months have the highest number of incidents?
SELECT DATENAME (Month, Date) AS Month, COUNT(*) AS Highest_Number_of_Incidents
FROM[dbo].['Workplace Safety Data$']
GROUP BY MONTH (Date), DATENAME (Month, Date)
ORDER BY Highest_Number_of_Incidents DESC

--What is the total cost of "Vehicle" related incidents?
SELECT [Incident Type], SUM([Incident Cost]) AS Total_Cost
FROM[dbo].['Workplace Safety Data$']
WHERE [Incident Type]= 'Vehicle'
GROUP BY [Incident Type]

--Which age group is most affected by "Falling Object" incidents?
SELECT TOP(1) [Age Group], COUNT(*) AS Count_of_Falling_Objects
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type]= 'Falling Object' 
GROUP BY [Age Group]
ORDER BY Count_of_Falling_Objects DESC
