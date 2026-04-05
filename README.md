## 📅 Day 5: Data Cleaning (Handling Invalid Values)

### 🎯 Objective

Identify and correct logically incorrect or invalid values in the dataset to ensure data reliability.

### 🔧 Tasks Performed

* Detected invalid values such as:

  * Negative salaries
  * Invalid age entries
  * Incorrect ratings
* Defined valid ranges using business rules
* Replaced incorrect values using client-provided reference data
* Applied corrections using:

  * `CASE WHEN`
  * `JOIN-based UPDATE` statements
* Ensured no assumption-based modifications were made

### 🧠 Key Learnings

* Invalid values are not always missing — they can be logically incorrect
* Data corrections must rely on trusted sources (client/system data)
* Avoid modifying data without understanding the business context

### ✅ Outcome

The dataset now contains only valid and reliable values, significantly improving overall data quality and accuracy.
