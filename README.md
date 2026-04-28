# 📊 Day 29: SQL – Advanced Window Functions & Analysis

## 🔍 Objective

This project focuses on leveraging advanced window functions to analyze salary trends, ranking, and historical comparisons.
The goal is to understand how employee salaries evolve over time and how they compare within departments.

---

## 🧠 Key Tasks Performed

### 1. Latest Salary with Cumulative Total

* Retrieved the latest salary record for each employee
* Calculated running total (cumulative salary) up to that point
* Used `ROW_NUMBER()` / `MAX()` with window functions
* Used `SUM() OVER()` for cumulative calculation

---

### 2. Salary Ranking with Department Comparison

* Ranked employees based on salary
* Compared each employee’s salary with their department average
* Classified employees as:

  * Above Average
  * Below Average
  * Equal to Average
* Used `RANK()` and `AVG() OVER(PARTITION BY dept_id)`

---

### 3. Salary Trend Analysis (Increase / Decrease)

* Compared current salary with previous salary record
* Identified:

  * Salary Increased
  * Salary Decreased
  * No Change
* Used `LAG()` window function

---

## ⚙️ SQL Concepts Used

* **Window Functions** → `ROW_NUMBER()`, `RANK()`, `LAG()`, `SUM() OVER()`, `AVG() OVER()`
* **PARTITION BY** for employee and department-level analysis
* **ORDER BY** within window functions for time-based calculations
* **CTEs (WITH clause)** for structured queries
* **CASE WHEN** for classification logic

---

## 💡 Key Insights

* Running totals help track salary growth over time
* Ranking highlights employee positioning within departments
* Trend analysis reveals salary progression patterns
* Window functions enable powerful time-based comparisons

---

## 🚀 Outcome

This project strengthens:

* Advanced SQL analytical thinking
* Real-world data analysis skills
* Ability to work with historical and time-series data

---

## 🔗 Project Link

👉 https://github.com/ASHA-KORADA/50days_MySql/blob/main/Quries/day-29.sql

---

## 📌 Tags

`SQL` `Advanced SQL` `Window Functions` `Time Series Analysis` `Ranking` `Data Analytics`
