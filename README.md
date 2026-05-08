# Day 38: SQL Triggers – Automation & Data Protection

## Overview

In Day 38, I worked with SQL Triggers to automate database actions and protect data integrity.
This task focused on using BEFORE UPDATE and AFTER INSERT triggers in MySQL.

---

## Tasks Completed

### 1. BEFORE UPDATE Trigger

* Created a trigger to prevent negative salary updates
* Ensured salary values remain valid
* Protected employee salary data from incorrect updates

### 2. AFTER INSERT Trigger

* Created a trigger to automatically log attendance activity
* Trigger executes immediately after inserting attendance records

### 3. Attendance Logging System

* Stored attendance activity inside the `attendance_logs` table
* Maintained automated tracking of employee attendance operations

### 4. Trigger Testing

* Tested trigger execution using:

  * UPDATE operations
  * INSERT operations
* Verified automation and data protection functionality

---

## Concepts Practiced

* SQL Triggers
* BEFORE UPDATE Trigger
* AFTER INSERT Trigger
* Data Validation
* Automation in SQL
* Logging Mechanism
* Data Integrity

---

## Key Learnings

* Triggers help automate repetitive database operations
* BEFORE triggers are useful for validation and protection
* AFTER triggers are useful for logging and auditing
* Triggers improve data consistency and reduce manual work

---

## Tools Used

* MySQL
* VS Code SQL Extension

---

## Outcome

Successfully implemented SQL triggers for:

* Preventing invalid salary updates
* Automating attendance logging
* Improving database integrity and automation
