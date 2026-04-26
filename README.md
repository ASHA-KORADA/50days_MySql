# 📊 Day 27: SQL – Overall Salary Comparison

## 🔍 Objective

This project focuses on analyzing employee and department salary contributions using SQL.
The goal is to derive meaningful insights by comparing individual and departmental salaries against overall metrics.

---

## 🧠 Key Tasks Performed

### 1. Employee Salary vs Overall Average

* Calculated overall average salary of all employees
* Compared each employee’s salary with average:

  * Above Average
  * Below Average
  * Equal to Average

---

### 2. Employee Contribution to Total Salary

* Calculated total salary of all employees
* Compared each employee’s salary:

  * Salary > 10% of total → **High Contributor**
  * Else → **Low Contributor**

---

### 3. Department Contribution to Total Salary

* Calculated total salary for each department
* Compared department totals with overall salary:

  * Dept total > 30% of overall → **High Dept**
  * Else → **Low Dept**

---

## ⚙️ SQL Concepts Used

* **Window Functions** → `AVG() OVER()`, `SUM() OVER()`
* **PARTITION BY** for department-level analysis
* **CASE WHEN** for classification logic
* **CTEs (WITH clause)** for structured queries
* **JOINs** to combine employee, salary, and department data

---

## 💡 Key Insights

* Individual salary comparison helps identify top and low performers
* Contribution analysis highlights employees impacting business revenue
* Department-level comparison reveals dominant business units

---

## 🚀 Outcome

This project enhances:

* Analytical SQL skills
* Real-world business understanding
* Ability to derive insights from raw data

---

## 🔗 Project Link

👉 https://github.com/ASHA-KORADA/50days_MySql/blob/main/Quries/day%2027.sql

---

## 📌 Tags

`SQL` `Data Analytics` `Window Functions` `Business Analysis` `Case Study`
