# Day 39: SQL Triggers – Validation & Logging

## Overview

In Day 39, I continued exploring SQL Triggers by focusing on data validation and change tracking.
This task helped me understand how databases can automatically validate data before insertion and maintain logs whenever important values are updated.

---

## Tasks Completed

### 1. BEFORE INSERT Trigger

* Created a trigger to prevent negative salary insertion
* Added validation logic before inserting employee records
* Improved data quality and consistency

### 2. Automatic Salary Correction

* Automatically converted negative salary values to `0`
* Ensured invalid salary entries are handled before storing data

### 3. AFTER UPDATE Trigger

* Created a trigger to track salary changes after updates
* Captured salary modification activity automatically

### 4. Salary Change Logging

* Stored old salary and new salary details inside the `salary_logs` table
* Maintained salary history for auditing and tracking purposes

---

## Concepts Practiced

* SQL Triggers
* BEFORE INSERT Trigger
* AFTER UPDATE Trigger
* Data Validation
* Automatic Data Correction
* Audit Logging
* OLD and NEW Keywords
* Database Automation

---

## Key Learnings

* BEFORE triggers help validate and modify data before insertion
* AFTER triggers are useful for tracking and auditing changes
* Triggers reduce manual monitoring and improve automation
* Logging mechanisms help maintain transparency in database operations
* Databases can automatically enforce business rules using triggers

---

## Tools Used

* MySQL
* VS Code SQL Extension

---

## Outcome

Successfully implemented SQL triggers for:

* Preventing invalid salary insertion
* Automatically correcting salary values
* Tracking salary updates
* Maintaining salary history logs automatically
