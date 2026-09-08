# 📊 HR Analytics – Employee Attrition & Workforce Insights

## Project Overview

This project analyzes employee data to better understand workforce characteristics, employee satisfaction, performance, compensation, and attrition.

The project follows an end-to-end data analytics workflow using **Excel, SQL, and Power BI**. The dataset was cleaned and prepared for analysis, explored using Excel and SQL, and visualized in Power BI to identify patterns that could support HR decision-making.

---

## 🎯 Project Objectives

The analysis was conducted to answer questions such as:

- How is the workforce distributed across departments and positions?
- What is the gender and age distribution of employees?
- What is the average salary?
- Which departments have the highest average salaries?
- How satisfied are employees with their jobs?
- Are less satisfied employees more likely to leave?
- Does employee performance relate to attrition?
- Are there differences in attrition across departments, positions, and gender?
- Are full-time employees more satisfied than part-time or contract employees?
- How much training do employees receive?
- What percentage of employees are enrolled in benefits?

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **Microsoft Excel** | Data cleaning, preparation, exploratory analysis and PivotTables |
| **SQL / MySQL** | Data transformation, querying and exploratory analysis |
| **Power BI** | Data modeling, visualization and dashboard development |
| **DAX** | Creation of measures and calculations in Power BI |

---

## 🧹 Data Cleaning & Preparation

The original HR dataset contained several data-quality issues that required cleaning before analysis.

Some of the issues included:

- Missing values
- Blank fields
- `N/A` values
- Inconsistent capitalization
- Inconsistent department and employment-status values
- Ages stored as text
- Salaries stored as text
- Inconsistent date formats
- Incorrect data types

Cleaned fields were created, including:

- `Age_clean`
- `Salary_clean`
- `Department_clean`
- `Status_clean`
- `Joining_Date_clean`
- `Benefits_clean`
- `Email_clean`

In SQL, blank and `N/A` values were converted to `NULL`, date fields were standardized, and appropriate data types were assigned.

A dedicated analysis view was then created:

`hr_analysis_view`

This allowed the analysis to focus only on the variables required for the project.

---

## 🔎 Exploratory Data Analysis

Excel PivotTables and SQL queries were used to explore the workforce and answer key HR questions.

Some of the main metrics identified include:

| Metric | Result |
|--------|-------:|
| Total Employees | 1,000 |
| Female Employees | 493 |
| Male Employees | 507 |
| Average Age | 36.14 years |
| Average Years of Service | 4.53 years |
| Average Salary | ~60,000 |
| Average Job Satisfaction | 2.92 / 5 |
| Average Training Hours | 41.81 hours |

### Employees by Department

| Department | Employees |
|------------|----------:|
| Finance | 218 |
| Sales | 202 |
| HR | 200 |
| IT | 193 |
| Marketing | 187 |

The workforce is relatively evenly distributed across the five departments, with Finance having the largest number of employees.

---

## 💼 Workforce Overview

The Power BI workforce dashboard examines:

- Employee count by department
- Employee count by position
- Employee count by age group
- Gender distribution
- Average salary by gender

The workforce is almost evenly divided by gender, with **507 male employees and 493 female employees**.

The dashboard also indicates that salary differences between male and female employees are relatively small at the overall workforce level.

---

## 😊 Employee Job Satisfaction

Average job satisfaction across the organization is approximately **2.92 out of 5**.

### Satisfaction by Department

| Department | Average Satisfaction |
|------------|---------------------:|
| Marketing | 3.01 |
| HR | 2.99 |
| Sales | 2.98 |
| IT | 2.91 |
| Finance | 2.72 |

Marketing employees recorded the highest average satisfaction, while Finance recorded the lowest.

### Satisfaction by Position

| Position | Average Satisfaction |
|----------|---------------------:|
| Manager | 3.13 |
| Clerk | 2.98 |
| Director | 2.92 |
| Assistant | 2.87 |
| Analyst | 2.70 |

Managers reported the highest average job satisfaction, while Analysts reported the lowest.

Employment type and gender showed very little variation in average satisfaction.

---

## 📉 Employee Attrition Analysis

One of the main objectives of the project was to understand the factors associated with employees leaving the organization.

### Attrition by Job Satisfaction

| Job Satisfaction | Attrition Rate |
|------------------:|---------------:|
| 1 | 58.72% |
| 2 | 53.27% |
| 3 | 27.47% |
| 4 | 26.21% |
| 5 | 25.56% |

The strongest pattern identified in the attrition analysis was **job satisfaction**.

Employees with the lowest satisfaction level had an attrition rate of **58.72%**, compared with **25.56%** among employees with the highest satisfaction level.

This suggests a strong association between employee satisfaction and retention in this dataset.

### Attrition by Department

| Department | Attrition Rate |
|------------|---------------:|
| Marketing | 42.78% |
| IT | 40.41% |
| Finance | 40.37% |
| Sales | 36.63% |
| HR | 36.00% |

Marketing recorded the highest attrition rate, while HR recorded the lowest.

### Attrition by Position

Attrition rates across positions were relatively close, although Analysts recorded the highest rate at **41.75%**.

### Attrition by Gender

- Male: **40.04%**
- Female: **38.34%**

The difference is relatively small, suggesting gender is not a major differentiating factor in attrition within this dataset.

---

## ⭐ Performance & Attrition

Attrition was also analyzed by employee performance score.

Employees receiving an **A performance score** recorded the lowest attrition rate at **30.73%**.

Other performance groups recorded attrition rates of approximately 39–43%.

This indicates that the highest-performing employees were more likely to remain with the organization than employees in the other performance categories.

---

## 💡 Key Insights

The analysis identified several important workforce patterns:

1. **Job satisfaction has the clearest relationship with employee attrition.**
   Employees reporting low satisfaction experienced substantially higher attrition.

2. **Finance has the lowest average job satisfaction.**
   Its average satisfaction score of 2.72 is below the other departments.

3. **Marketing has the highest departmental attrition rate.**
   Approximately 42.78% of Marketing employees left the organization.

4. **Analysts have comparatively low satisfaction.**
   Analysts recorded the lowest average satisfaction among positions at 2.70.

5. **Gender differences are minimal.**
   Both job satisfaction and attrition rates are similar between male and female employees.

6. **Employment type has little relationship with satisfaction.**
   Full-Time, Part-Time and Contract employees all average approximately 2.9.

7. **The highest-performing employees have lower attrition.**
   Employees receiving an A performance score had a noticeably lower attrition rate than the other performance groups.

---

## 📌 Recommendations

Based on the analysis:

- **Prioritize employee satisfaction:** HR should investigate the drivers of dissatisfaction, particularly among employees scoring 1 or 2.

- **Investigate Finance employee experience:** Finance has the lowest departmental satisfaction and may require targeted engagement initiatives.

- **Review Marketing retention:** Marketing has the highest departmental attrition rate and should be examined for possible retention issues.

- **Focus on Analysts:** Analysts show relatively low satisfaction and comparatively high attrition.

- **Protect high-performing talent:** Since top performers have lower attrition, the organization should continue supporting recognition, development and retention initiatives for high-performing employees.

- **Use employee feedback:** Regular satisfaction surveys and exit interviews could help identify the underlying reasons employees leave.

---

## 📊 Power BI Dashboard

The Power BI report contains three main analytical pages:

### 1. Workforce Overview
Provides an overview of workforce composition across departments, positions, age groups and gender.

### 2. Employee Job Satisfaction Analysis
Examines satisfaction across department, position, employment type, age group and gender.

### 3. Employee Attrition Rate
Analyzes attrition according to job satisfaction, performance, gender, position and department.

---

## 📂 Repository Structure

```text
HR-Analytics-Project/
│
├── data/
│   ├── HR_data.xlsx
│   └── HR_data_clean.xlsx
│
├── sql/
│   └── HR_analysis.sql
│
├── powerbi/
│   └── HR_Analytics_Dashboard.pbix
│
├── images/
│   ├── workforce_overview.png
│   ├── job_satisfaction_analysis.png
│   └── employee_attrition.png
│
└── README.md
