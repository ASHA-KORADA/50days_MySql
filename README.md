# Day 42: SQL Tasks – Data Cleaning & Duplicate Handling

## Overview

Today’s focus was on performing essential **Data Cleaning Operations** in MySQL using duplicate tables created from the original dataset.
The tasks covered cleaning inconsistent text data, handling NULL values, identifying duplicate records, and removing duplicates using window functions.

---

## Tasks Completed

### 1. Created Duplicate Tables for Cleaning Process

Created separate cleaning tables to safely perform transformations without affecting the original data.

Tables created:

* `cleaned_customers`
* `cleaned_products`
* `cleaned_orders`
* `cleaned_order_details`
* `cleaned_payments`

---

### 2. Removed Leading & Trailing Spaces

Used string cleaning techniques to remove unnecessary spaces from text columns for better consistency and accuracy.

Topics Covered:

* Extra spaces in names and text fields
* Standardized formatting
* Data consistency improvement

---

### 3. Standardized Text Formatting

Converted text values into a consistent format using uppercase transformation techniques.

Examples:

* Customer names
* Product categories
* Payment methods
* City and state names

---

### 4. Replaced NULL Values with Default Values

Handled missing values by replacing NULLs with meaningful default values to improve data quality and avoid analysis issues.

Examples:

* Unknown
* Not Available
* 0
* Pending

---

### 5. Identified Duplicate Records

Used window functions and row numbering techniques to identify duplicate records in tables.

Concepts Practiced:

* `ROW_NUMBER()`
* `PARTITION BY`
* Duplicate detection logic

---

### 6. Removed Duplicate Records

Applied duplicate removal logic while preserving the original valid record.

Concepts Practiced:

* Window Functions
* Duplicate cleanup strategies
* Safe deletion techniques

---

## Concepts Learned

* Data Cleaning in SQL
* Duplicate Table Creation
* String Functions
* NULL Handling
* Window Functions
* Duplicate Detection
* Duplicate Removal Techniques
* Data Standardization

---

## Key Takeaway

Data cleaning is one of the most important steps in real-world data analysis and database management.
This task helped in understanding how raw data can be transformed into clean, consistent, and analysis-ready data using SQL.

---

## GitHub Repository
https://github.com/ASHA-KORADA/50days_MySql/blob/main/Quries/day-42.sql
