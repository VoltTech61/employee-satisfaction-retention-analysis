CREATE DATABASE hr_data_;
USE hr_data_;

-- To check data types in the columns
DESCRIBE hr_data;

-- updating other columns if this empty '' to NULL
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_data
SET
    Phone_Number = NULLIF(Phone_Number, ''),
    Manager_ID = NULLIF(Manager_ID, ''),
    Sick_Days_Taken = NULLIF(Sick_Days_Taken, ''),
    Vacation_Days_Remaining = NULLIF(Vacation_Days_Remaining, ''),
    Last_Promotion_Date = NULLIF(Last_Promotion_Date, ''),
    Training_Hours = NULLIF(Training_Hours, ''),
    Joining_Date_clean = NULLIF(Joining_Date_clean, '')
WHERE
    Phone_Number = ''
    OR Manager_ID = ''
    OR Sick_Days_Taken = ''
    OR Vacation_Days_Remaining = ''
    OR Last_Promotion_Date = ''
    OR Training_Hours = ''
    OR Joining_Date_clean = '';
-- changing N/A values to NULL
UPDATE hr_data
SET
    Sick_Days_Taken = CASE
        WHEN Sick_Days_Taken = 'N/A' THEN NULL
        ELSE Sick_Days_Taken
    END,
    Vacation_Days_Remaining = CASE
        WHEN Vacation_Days_Remaining = 'N/A' THEN NULL
        ELSE Vacation_Days_Remaining
    END,
    Training_Hours = CASE
        WHEN Training_Hours = 'N/A' THEN NULL
        ELSE Training_Hours
    END;

UPDATE hr_data
SET Last_Promotion_Date = NULL
WHERE Last_Promotion_Date = 'N/A';

-- Changing date and date_added to my preffered format
UPDATE hr_data
SET Joining_Date_clean = DATE_FORMAT(STR_TO_DATE(Joining_Date_clean, '%d/%m/%Y'), '%Y-%m-%d')
WHERE Joining_Date_clean IS NOT NULL
AND Joining_Date_clean <> '';
UPDATE hr_data
SET Last_Promotion_Date = DATE_FORMAT(STR_TO_DATE(Last_Promotion_Date, '%d/%m/%Y'), '%Y-%m-%d')
WHERE Last_Promotion_Date IS NOT NULL
AND Last_Promotion_Date <> ''
AND Last_Promotion_Date <> 'N/A';


     -- Changing the data type of all the required column
    ALTER TABLE hr_data
MODIFY COLUMN Sick_Days_Taken INT,
MODIFY COLUMN Training_Hours INT,
MODIFY COLUMN Vacation_Days_Remaining INT,
MODIFY COLUMN Joining_Date_clean DATE,
MODIFY COLUMN Last_Promotion_Date DATE;

-- Select the only columns needed
CREATE VIEW hr_analysis_view AS
SELECT
    Employee_ID,
    Age_clean,
    Gender,
    Department_clean,
    Position,
    Salary_clean,
    Joining_Date_clean,
    Years_of_Service,
    Performance_Score,
    Performance_Score_Numeric,
    Status_clean,
    job_satisfaction,
    attrition,
    Sick_Days_Taken,
    Vacation_Days_Remaining,
    Training_Hours,
    Benefits_clean,
    Last_Promotion_Date
FROM hr_data;

-- check the columns
SELECT *
FROM hr_analysis_view;

-- Analysis questions
-- How many employees work in each department? 
SELECT Department_clean,
       COUNT(Employee_ID)  Total_Employees
FROM hr_analysis_view
GROUP BY Department_clean;

-- What is the average salary in the company? 
SELECT ROUND(AVG(Salary_clean), 2) AS Average_Salary
FROM hr_analysis_view;

-- What is the gender distribution in the company? 
SELECT Gender,
       COUNT(Employee_ID) AS  Total_Employees
FROM hr_analysis_view
GROUP BY Gender;

-- How old are employees on average? 
SELECT ROUND(AVG(age_clean), 2) AS Average_Age
FROM hr_analysis_view;

-- How long do employees typically stay at the company? 
SELECT ROUND(AVG(Years_of_Service), 2) AS Average_Years
FROM hr_analysis_view;

-- What are the job satisfaction levels? 
SELECT
    CASE
        WHEN Job_Satisfaction = 1 THEN 'Very Dissatisfied'
        WHEN Job_Satisfaction = 2 THEN 'Dissatisfied'
        WHEN Job_Satisfaction = 3 THEN 'Neutral'
        WHEN Job_Satisfaction = 4 THEN 'Satisfied'
        WHEN Job_Satisfaction = 5 THEN 'Very Satisfied'
    END AS job_satisfaction_level,
    COUNT(Employee_ID) AS Total_Employees
FROM hr_analysis_view
GROUP BY Job_Satisfaction
ORDER BY Job_Satisfaction;

-- How many employees left the company? 
SELECT COUNT(Employee_ID) AS Employees_Left
FROM hr_analysis_view
WHERE Attrition = 'Yes';

-- Which positions are most common? 
SELECT
    Position,
    COUNT(Employee_ID) AS Total_Employees
FROM hr_analysis_view
GROUP BY Position
ORDER BY Total_Employees DESC;

-- How many sick days do employees take on average? 
SELECT ROUND(AVG(Sick_Days_Taken), 2) AS Average_Sick_Days
FROM hr_analysis_view;

-- How much vacation time is unused? 
SELECT ROUND(AVG(Vacation_Days_Remaining), 2) AS Average_Unused_Vacation
FROM hr_analysis_view;

-- What percentage of employees are enrolled in benefits? No else so the 'No(S) are null therefore we use count()
SELECT
    ROUND(
        COUNT(CASE WHEN Benefits_clean = 'Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS Benefits_Percentage
FROM hr_analysis_view;

-- What are the performance score distributions? 
SELECT
    Performance_Score,
    COUNT(Employee_ID) AS Total_Employees
FROM hr_analysis_view
GROUP BY Performance_Score
ORDER BY Performance_Score ASC;

-- How much training do employees get? 
SELECT
    ROUND(AVG(Training_Hours), 2) AS Average_Training_Hours
FROM hr_analysis_view;

-- Which department has the highest salaries? 
SELECT
    Department_clean,
    ROUND(AVG(Salary_clean), 2) AS Average_Salary
FROM hr_analysis_view
GROUP BY Department_clean
ORDER BY Average_Salary DESC
LIMIT 1;

-- Are satisfied employees less likely to leave? 
SELECT
    job_satisfaction,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Company,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS Stayed
FROM hr_analysis_view
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- Do high performers earn more? 
SELECT
    Performance_Score,
    ROUND(AVG(Salary_Clean), 2) AS Average_Salary
FROM hr_analysis_view
GROUP BY Performance_Score
ORDER BY Performance_Score ASC;

-- What is the male vs female salary difference? 
SELECT
    Gender,
    ROUND(AVG(Salary_Clean), 2) AS Average_Salary
FROM hr_analysis_view
GROUP BY Gender;

-- How many employees started each year? 
SELECT
    YEAR(Joining_Date_clean) AS Joining_Year,
    COUNT(Employee_ID) AS Total_Employees
FROM hr_analysis_view
GROUP BY YEAR(Joining_Date_clean)
ORDER BY Joining_Year;

-- Which department has the best job satisfaction? 
SELECT
    Department_clean,
    ROUND(AVG(job_satisfaction), 2) AS Average_Job_Satisfaction
FROM hr_analysis_view
GROUP BY Department_clean
ORDER BY Average_Job_Satisfaction DESC;

-- Are Full-Time employees more satisfied than Part-Time? 
SELECT
    Status_clean,
    ROUND(AVG(job_satisfaction), 2) AS Average_Job_Satisfaction
FROM hr_analysis_view
GROUP BY Status_Clean
ORDER BY Average_Job_Satisfaction DESC;