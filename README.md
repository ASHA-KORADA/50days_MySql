# Day 40: SQL Temporary Tables – Session-Based Data Handling

## Overview

In Day 40, I explored Temporary Tables in MySQL and learned how they help manage intermediate or short-term data during query execution.

This task focused on creating temporary tables, storing aggregated data, joining temporary data with existing tables, and removing temporary tables after usage.

---

## Tasks Completed

### 1. Created Temporary Table

* Created a temporary table to store employee salary summaries
* Used the table for short-term data processing during the session

### 2. Inserted Aggregated Salary Data

* Inserted summarized salary data into the temporary table
* Used aggregate functions to calculate employee salary totals

### 3. Joined Temporary Table with Employee Table

* Joined temporary salary data with employee details
* Retrieved employee information along with summarized salary records

### 4. Dropped Temporary Table

* Removed the temporary table after usage
* Practiced proper cleanup of temporary database objects

---

## Concepts Practiced

* Temporary Tables
* Aggregate Functions
* GROUP BY
* Table Joins
* Session-Based Storage
* Intermediate Data Handling
* Data Summarization

---

## Key Learnings

* Temporary tables are useful for storing intermediate query results
* They exist only during the current database session
* Temporary tables help simplify complex queries
* They improve query readability and modularity
* Temporary tables are commonly used in reporting and ETL processes

---

## Tools Used

* MySQL
* VS Code SQL Extension

---

## Outcome

Successfully implemented temporary table operations for:

* Storing summarized salary data
* Performing joins using temporary datasets
* Managing session-level database objects
* Improving structured query workflows
