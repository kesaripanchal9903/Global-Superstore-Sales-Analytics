# Global Superstore – Sales & Business Performance Analytics

**An end-to-end Data Analytics portfolio project focused on analysing sales, profitability, customer behaviour, product performance, and shipping operations using Excel, Python, MySQL, SQL, and Looker Studio.**

## Project Overview

This project analyses the Global Superstore dataset containing 51,290 records to identify business trends, evaluate profitability, understand customer and product performance, and generate actionable business insights.

The project follows an end-to-end analytics workflow, from data quality assessment and cleaning to SQL-based analysis, interactive dashboard development, and business recommendations.

## Business Objectives

- Analyse overall sales and profit performance.
- Identify high-performing and loss-making products.
- Evaluate sales and profitability across regions and categories.
- Understand customer segments and customer profitability.
- Analyse the relationship between discounts and profitability.
- Evaluate shipping methods, costs and delivery duration.
- Identify opportunities for improving business performance.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Excel | Data exploration and quality assessment |
| Python (Pandas) | Data cleaning and transformation |
| MySQL | Database storage |
| SQL | Data analysis and business queries |
| Looker Studio | Interactive dashboard development |
| GitHub | Project documentation and version control |

## Dataset Overview

- **Dataset:** Global Superstore
- **Total Records:** 51,290
- **Final Columns:** 26
- **Data Type:** Retail transactional data

The dataset contains information about orders, customers, products, sales, profits, discounts, geographical locations and shipping.

For more details, refer to [Dataset Documentation](Dataset/README.md).

## Project Workflow

1. **Data Exploration:** Examined the dataset structure and performed initial data quality checks using Excel.
2. **Data Cleaning:** Used Python and Pandas to clean the dataset and standardise column names.
3. **Database Integration:** Imported the cleaned dataset into MySQL.
4. **SQL Analysis:** Performed exploratory, sales, profitability, customer and advanced SQL analysis.
5. **Dashboard Development:** Created an interactive Looker Studio dashboard.
6. **Business Insights:** Identified key findings and developed business recommendations.

## Key Performance Indicators (KPIs)

| KPI | Result |
|---|---:|
| Total Sales | $12,642,905 |
| Total Profit | $1,467,457.29 |
| Profit Margin | 11.61% |
| Total Orders | 25,035 |
| Unique Customers | 4,873 |
| Total Quantity Sold | 178,312 |

## Key Business Findings

- Technology generated the highest sales and profit among the product categories.
- Central was the leading region in total sales and profit.
- Tables was the only loss-making sub-category, with a loss of $64,083.39.
- Consumer contributed the highest sales and total profit among customer segments.
- Higher discount levels were associated with lower profit margins.
- December recorded the highest aggregated monthly sales.
- Standard Class accounted for the highest order volume.

For detailed findings and recommendations, refer to [Key Business Insights](Business-Insights/01_Key_Business_Insights.md).

## Interactive Dashboard

The Looker Studio dashboard is organised into three analytical pages:

**Page 1 – Executive Sales Overview**
- Overall business KPIs
- Monthly sales trends
- Category and sub-category performance
- Regional and country performance

**Page 2 – Customer & Product Analysis**
- Customer segment performance
- Top 10 customers by sales
- Top 10 products by profit
- Loss-making products

**Page 3 – Shipping & Operational Analysis**
- Shipping mode performance
- Order priority distribution
- Average shipping duration
- Shipping cost analysis

Interactive filters allow users to explore performance across different business dimensions.

**Dashboard URL:** To be added.

Refer to [Dashboard Documentation](Dashboard/README.md).

## Repository Structure

```text
Global-Superstore-Sales-Analytics/
│
├── Dataset/
│   └── README.md
│
├── Data-Cleaning/
    ├── README.md
│   └── data_cleaning.py

│
├── SQL-Analysis/
│   ├── README.md
│   ├── 01_Data_Exploration.sql
│   ├── 02_Sales_Analysis.sql
│   ├── 03_Profitability_Analysis.sql
│   ├── 04_Customer_Analysis.sql
│   └── 05_Advanced_SQL_Analysis.sql
│
├── Dashboard/
│   └── README.md
│
├── Business-Insights/
│   ├── README.md
│   └── 01_Key_Business_Insights.md
│
└── README.md
```
