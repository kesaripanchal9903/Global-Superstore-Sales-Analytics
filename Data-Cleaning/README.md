# Data Cleaning & Data Preparation

## Project: Sales & Business Performance Analytics

## 1. Objective

The objective of this stage was to inspect, clean, validate, and prepare the Global Superstore dataset for business analysis.

The data preparation process involved Microsoft Excel, Python (Pandas), Jupyter Notebook, and MySQL.

---

## 2. Dataset Overview

| Attribute | Details |
|---|---|
| Dataset Name | Global Superstore |
| Initial Records | 51,290 |
| Initial Columns | 27 |
| Final Records | 51,290 |
| Final Columns | 26 |
| Database | global_superstore |
| Table Name | orders |

---

## 3. Initial Data Quality Assessment

The dataset was initially reviewed using Microsoft Excel to identify potential data quality issues.

The following checks were performed:

| Validation Check | Result |
|---|---|
| Duplicate Records | None identified |
| Missing Values | None identified |
| Invalid Date Sequences | None identified |
| Negative Sales Values | None identified |
| Negative Quantity Values | None identified |
| Expected Columns | Verified |

---

## 4. Data Cleaning & Transformation

### 4.1 Dataset Loading and Inspection

- Loaded the Excel dataset into Python using Pandas.
- Inspected available worksheet names.
- Loaded the `superstore` worksheet.
- Reviewed dataset dimensions and column names.
- Inspected order date and shipping date columns.

### 4.2 Removal of Unnecessary Column

- Identified one corrupted non-English column.
- Removed the unnecessary column because it was not required for business analysis.
- Retained all 51,290 records.

**Result:** The dataset was reduced from 27 columns to 26 columns.

### 4.3 Column Name Standardisation

Standardised column names using Pandas to maintain consistency and improve SQL usability.

Transformations included:

- Removing leading and trailing spaces.
- Converting column names to lowercase.
- Replacing special characters and spaces with underscores.
- Removing unnecessary underscores.

Examples:

| Original Column | Standardised Column |
|---|---|
| Customer.ID | customer_id |
| Customer.Name | customer_name |
| Order.Date | order_date |
| Order.ID | order_id |
| Product.Name | product_name |
| Shipping.Cost | shipping_cost |
| Sub.Category | sub_category |

---

## 5. MySQL Database Integration

### 5.1 Database Connection

- Used SQLAlchemy and PyMySQL to connect Python with MySQL.
- Connected to the `global_superstore` database.
- Tested the database connection before importing the dataset.

### 5.2 SQL Data Type Configuration

Defined appropriate SQL data types for the dataset columns.

Examples include:

| Column | SQL Data Type |
|---|---|
| category | VARCHAR(100) |
| customer_id | VARCHAR(50) |
| customer_name | VARCHAR(150) |
| discount | DECIMAL(10,4) |
| order_date | DATE |
| order_id | VARCHAR(50) |
| profit | DECIMAL(15,4) |
| quantity | INTEGER |
| sales | DECIMAL(15,4) |
| shipping_cost | DECIMAL(15,4) |

### 5.3 Data Import

- Imported the prepared Pandas DataFrame into MySQL.
- Created the `orders` table in the `global_superstore` database.
- Used batch insertion with a chunk size of 1,000 records.
- Configured the import to replace an existing table.

---

## 6. Final Data Quality Summary

| Attribute | Result |
|---|---:|
| Final Records | 51,290 |
| Final Columns | 26 |
| Unnecessary Columns Removed | 1 |
| Duplicate Records Identified | 0 |
| Missing Values Identified | 0 |
| Database | global_superstore |
| Table | orders |

---

## 7. Tools & Technologies

- Microsoft Excel
- Python
- Pandas
- Jupyter Notebook
- SQLAlchemy
- PyMySQL
- MySQL Workbench

---

## 8. Outcome

The dataset was successfully inspected, cleaned, standardised, and imported into MySQL.

The final dataset contained 51,290 records and 26 columns and was ready for SQL-based analysis and dashboard development.

### Next Stage

[SQL Analysis](../SQL-Analysis/README.md)
