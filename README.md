# Day 37: SQL Tasks (Stored Procedures – Conditional & Aggregation)

## Overview
This project focuses on implementing Stored Procedures in MySQL using conditional logic and aggregation techniques. The tasks demonstrate how procedures can automate reusable business logic for employee salary analysis.

---

## Concepts Covered
- Stored Procedures
- Input Parameters
- Conditional Logic using IF
- Categorization using CASE
- Aggregation Functions
- GROUP BY
- Salary Analysis

---

## Tasks Performed

### 1. Salary-Based Message Using IF Condition
Created a stored procedure that:
- Accepts employee details
- Checks salary conditions
- Returns messages based on salary level

Example outcomes:
- High Salary
- Low Salary

---

### 2. Employee Categorization Using CASE Statement
Created a procedure to classify employees into salary categories:

| Salary Range | Category |
|---|---|
| Greater than 80000 | High |
| Greater than 40000 | Medium |
| Less than or equal to 40000 | Low |

This demonstrates practical usage of the CASE statement inside SQL procedures.

---

### 3. Aggregation Procedure for Total Salary
Implemented a stored procedure to:
- Calculate total salary
- Group employee salary information
- Perform aggregation using SUM()

This simulates real-world payroll and compensation reporting scenarios.

---

## Key Learnings
- Difference between simple and compound stored procedures
- Usage of conditional logic in SQL
- Applying business rules inside procedures
- Using aggregation functions within procedures
- Practical implementation of reusable SQL logic

---

## Tools Used
- MySQL
- VS Code
- MySQL Extension

---

## Real-World Applications
- HR Analytics
- Payroll Systems
- Employee Compensation Analysis
- Salary Band Classification
- Financial Reporting

---

## Outcome
Successfully built multiple stored procedures to handle:
- Conditional decision-making
- Employee categorization
- Aggregated salary calculations

These tasks strengthen understanding of procedural SQL and business-oriented database operations.
