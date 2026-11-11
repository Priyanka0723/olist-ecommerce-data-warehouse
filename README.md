# Brazilian E-Commerce Data Warehouse & Business Analysis

## Project Overview

This project builds a data warehouse using the Brazilian E-Commerce Public Dataset by Olist. It transforms raw e-commerce data into structured dimension and fact tables and uses SQL to analyse sales, customer behaviour, payment methods, product categories, seller performance, customer reviews, and delivery performance.

The goal is to demonstrate an end-to-end data analytics workflow, from data profiling and cleaning to dimensional modelling, SQL analysis, and business insights.

## Project Objectives

- Profile and assess the quality of raw e-commerce data.
- Clean and prepare datasets using Python.
- Design a dimensional data warehouse using a fact constellation schema.
- Implement dimension and fact tables in MySQL.
- Create reporting views for analytical queries.
- Answer business questions using SQL.
- Identify meaningful patterns and operational insights.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data profiling, cleaning, transformation |
| Pandas | Data manipulation and quality checks |
| Jupyter Notebook | Python development |
| MySQL 8.0 | Data warehouse implementation and SQL analysis |
| MySQL Workbench | Database development and validation |
| GitHub | Project documentation and version control |

## Dataset

The project uses the Olist Brazilian E-Commerce Public Dataset, which contains information about orders, customers, products, sellers, payments, reviews, and geographical locations.

The original dataset contains 9 CSV files.

## Project Workflow

1. **Data Profiling:** Examined row counts, column structures, missing values, duplicates, invalid values, and inconsistencies.
2. **Data Cleaning:** Investigated data-quality issues and prepared cleaned datasets using Python.
3. **Data Transformation:** Created five dimension datasets and three fact datasets.
4. **Data Warehouse Development:** Created staging tables and implemented the dimensional model in MySQL.
5. **Data Loading:** Loaded the transformed datasets into dimension and fact tables.
6. **Validation:** Checked row counts, primary keys, foreign-key relationships, and reporting-view records.
7. **SQL Business Analysis:** Developed queries to investigate business performance and customer experience.

## Data Warehouse Design

The project follows a **Fact Constellation (Galaxy) Schema**, where multiple fact tables share common dimensions.

### Dimension Tables

| Dimension | Records |
|---|---:|
| DimCustomer | 99,441 |
| DimProduct | 32,951 |
| DimSeller | 3,095 |
| DimDate | 1,314 |
| DimPaymentType | 5 |

### Fact Tables

| Fact Table | Records | Grain |
|---|---:|---|
| FactOrderItems | 112,650 | One order item per order |
| FactPayments | 103,886 | One payment sequence per order |
| FactReviews | 99,224 | One review-order combination |

## Data Quality Findings

Some important issues identified during profiling and cleaning:

- 4,908 missing values in the original orders dataset.
- 23 inconsistent delivery timestamp records.
- 2,448 missing values in the cleaned product dataset.
- 145,903 missing review title and message fields.
- Geolocation records reduced from 1,000,163 to 738,332 after exact duplicate removal.
- 9 zero-value payment records and 2 zero-installment records.

Missing values and exceptional records were investigated rather than automatically replacing all of them.

## Business Questions & Key Findings

The SQL analysis explored 14 business questions, including:

- Which product categories generate the highest order-item value?
- How does item value change over time?
- Which customer states and cities generate the highest demand?
- Which payment methods are most commonly used?
- What is the distribution of customer review scores?
- Which categories have comparatively higher negative-review percentages?
- What percentage of orders with complete delivery dates arrived late?
- Which sellers generate the highest order-item value?
- How do delivery outcomes relate to customer review scores?
- What proportion of total item value is attributable to freight?

### Selected Insights

- Health & Beauty ranked first among product categories by total order-item value.
- São Paulo generated the highest order-item value among customer states.
- Credit card was the dominant payment method.
- Approximately 77.07% of customer reviews had a score of 4 or 5.
- Approximately 91.89% of orders with both actual and estimated delivery dates were delivered on time or early.
- Late deliveries were associated with lower average review scores than on-time or early deliveries.
- Freight represented approximately 14.21% of combined order-item value.

*Note: Payment value and order-item value are different measures. They should not automatically be treated as equal or as recognized revenue.*

## Repository Structure

```text
Olist_Data_Warehouse/
│
├── Dataset/
│   ├── Raw/
│   ├── Processed/
│   └── Transformed/
│
├── Python/
│
├── SQL/
│   ├── 01_Staging/
│   ├── 02_Data_Warehouse/
│   ├── 03_Reporting_Views/
│   ├── 04_Business_Analysis/
│   └── 05_Data_Validation/
│
├── Fabric/
├── PowerBI/
├── Documentation/
│
└── README.md
```

## Project Status

**Completed:**
- Data profiling and quality investigation.
- Data cleaning and transformation using Python.
- Dimensional data modelling.
- MySQL staging and data warehouse tables.
- Loading and validation of dimension and fact tables.
- Reporting views.
- SQL business analysis.

**Planned next:**
- Build an interactive Power BI dashboard.
- Add dashboard screenshots and analytical documentation.
- Improve project presentation for portfolio review.

## Conclusion

This project demonstrates practical experience in data preparation, data quality assessment, dimensional modelling, MySQL data warehouse development, SQL querying, and translating data into business insights.

The project was developed as a practical portfolio project to strengthen my skills for entry-level Data Analyst opportunities.
