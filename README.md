# Student Performance Analysis
## Pluto Academy Data Analytics Internship — Project 2

---

## 📌 Project Overview
Analysed performance data of 1,000 students to understand 
which factors affect grades, identify at-risk students, 
and produce actionable recommendations for school improvement.

---

## 🛠️ Tools Used
- **SQL** (PostgreSQL + pgAdmin) — Data exploration & analysis
- **Excel** — Visualisations & Interactive Dashboard

---

## 📁 Dataset
- Source: Students Performance in Exams (Kaggle)
- Size: 1,000 student records
- Link: https://www.kaggle.com/datasets/spscientist/students-performance-in-exams

---

## 📊 Factor Analysis Questions Answered
1. Does parental education level affect scores?
2. Do students who complete test prep score higher?
3. What is the correlation between reading, writing and math scores?
4. Which gender performs better in which subject?
5. What is the distribution of total scores?

---

## 🔍 Key Findings
1. **Parental Education** — Master's degree parents avg 75.68 writing vs High School 62.45
2. **Test Preparation** — Completed students score 5-10 points higher in all subjects
3. **Score Correlation** — Reading and Writing strongly correlated (0.95)
4. **Gender** — Males better in Math (68.73), Females better in Reading (72.61) and Writing (72.47)
5. **Total Score** — Avg 203.31/300, range 27-300, std deviation 42.77

---

## ⚠️ At-Risk Students
- Total At-Risk: **188 students (18.8%)**
- **152** at-risk students had NO test preparation
- **36** at-risk students completed test preparation
- Highest at-risk group: Male, No test prep, High School educated parents

---

## 📋 Principal's Report — 3 Recommendations
1. Make test preparation mandatory for all students especially those from lower parental education backgrounds
2. Introduce special reading and writing support programs for male students who consistently score lower
3. Provide additional academic support to students from High School educated parent backgrounds

---

## 📊 Dashboard Preview
## 📊 Dashboard Preview

This interactive Excel dashboard provides a comprehensive overview of student 
performance across 1,000 students. It includes 4 KPI cards showing Total Students, 
At-Risk Students, Average Total Score, and Test Prep Completion rate. Six charts 
visualise key findings including parental education impact, test preparation effect, 
gender performance differences, at-risk segmentation, and total score distribution. 
The dashboard is built using Excel Pivot Tables and Charts for dynamic data analysis.

---

## 📂 Files in this Repository
| File | Description |
|------|-------------|
| `Project2_Student_Analysis.xlsx` | Excel dashboard with 6 charts and Principal's Report |
| `project2_queries.sql` | All PostgreSQL queries used for analysis |
| `StudentsPerformance.csv` | Original dataset from Kaggle |
| `Project2_Dashboard.png` | Dashboard screenshot |

---

## 🎯 At-Risk Segmentation Summary
| Group | At-Risk Count | Percentage |
|-------|--------------|------------|
| No Test Prep | 152 | 80.85% |
| Completed Test Prep | 36 | 19.15% |
| **Total** | **188** | **18.8% of 1000** |


