# Dataset Documentation

## Project: Sales & Business Performance Analytics

### Dataset Overview

This project uses the Global Superstore dataset to analyse sales, profitability, customer behaviour, product performance, and shipping operations.

The dataset contains transactional records of orders across different countries, regions, customer segments, product categories, and shipping modes.

### Dataset Information

| Attribute | Details |
|---|---|
| Dataset Name | Global Superstore |
| Total Records | 51,290 |
| Total Columns | 26 |
| Data Type | Transactional Sales Data |
| Database | MySQL |
| Main Table | orders |

### Key Dataset Fields

| Field | Description |
|---|---|
| Order ID | Unique order identifier |
| Order Date | Date when the order was placed |
| Ship Date | Date when the order was shipped |
| Customer ID | Customer identifier |
| Customer Name | Customer name |
| Segment | Customer segment |
| Country | Country of the order |
| Region | Business region |
| State | State or province |
| City | City of the order |
| Category | Product category |
| Sub-Category | Product sub-category |
| Product Name | Product name |
| Sales | Sales amount |
| Quantity | Quantity ordered |
| Discount | Discount applied |
| Profit | Profit or loss |
| Shipping Cost | Shipping expense |
| Ship Mode | Shipping method |
| Order Priority | Order priority |

### Dataset Usage

The dataset was used for:

- Sales and profit performance analysis.
- Regional and geographical performance analysis.
- Category and sub-category analysis.
- Customer segment and customer profitability analysis.
- Discount impact on profitability.
- Shipping cost and delivery duration analysis.
- Monthly and yearly business trends.

### Data Preparation

The original dataset was reviewed and prepared before analysis.

Data profiling and cleaning activities included:

- Checking duplicate records.
- Checking missing values.
- Validating order and shipping dates.
- Checking negative sales and quantity values.
- Removing an unnecessary corrupted non-English column.
- Preparing the final dataset for MySQL analysis.

### Final Dataset

After preparation, the dataset contained:

- **51,290 records**
- **26 columns**
- No identified duplicate records.
- No identified missing values in the initial profiling checks.

For further details, refer to the [Data Cleaning Documentation](../Data-Cleaning/README.md).

---

*Note: The dataset is used for educational and portfolio analysis purposes.*
