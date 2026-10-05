# Finance & Supply Chain Analytics – SQL Project

## Project Overview

This project focuses on **Finance & Supply Chain Analytics for AtliQ Hardware** using **Microsoft SQL Server**.

The project analyzes sales, customers, products, pricing, manufacturing costs, freight costs, deductions, and forecast data using SQL.

## Objectives

- Analyze monthly sales performance.
- Compare product performance by sales quantity and revenue.
- Analyze customer, channel, market, and regional performance.
- Compare gross price with manufacturing cost.
- Analyze pre-invoice and post-invoice deductions.
- Analyze freight costs across markets and fiscal years.
- Evaluate forecast quantity against actual sales.
- Apply advanced SQL techniques for business analysis.

## Database

**Database Name:** `SupplyChainFinanceManagement`

### Tables

#### Dimension Tables
- `dim_customer` – customer, platform, channel, market, sub-zone, and region information.
- `dim_product` – product, division, segment, category, and variant information.

#### Fact Tables
- `fact_forecast_monthly` – monthly forecast quantity by product and customer.
- `fact_freight_cost` – freight and other cost percentages by market and fiscal year.
- `fact_gross_price` – gross price by product and fiscal year.
- `fact_manufacturing_cost` – manufacturing cost by product and cost year.
- `fact_post_invoice_deductions` – post-invoice discounts and other deductions.
- `fact_pre_invoice_deductions` – yearly pre-invoice discount information.
- `fact_sales_monthly` – monthly sales transactions and sold quantity.

## Financial Logic

The project uses the following business calculations:

**Net Sales = Gross Price − Pre-Invoice Deduction − Post-Invoice Deduction**

**Gross Margin = Net Sales − COGS**

**Gross Margin % = Gross Margin / Net Sales × 100**

COGS includes manufacturing, freight, and other costs.

## Fiscal Year

The project uses a **September–August fiscal year**.

For example:

`September 2022 – August 2023 = Fiscal Year 2023`

## Tasks Completed

### Task 1 – Database & Table Creation
Created the `SupplyChainFinanceManagement` database and the required dimension and fact tables.

### Task 2 – Data Insertion
Inserted the records provided in the project material into the respective tables.

### Task 3 – Basic SQL Analysis
- Fiscal year calculation.
- Monthly product transaction reporting.
- Product, variant, quantity, gross price, and gross price total analysis.

### Task 4 – Business Analysis
Performed 20 business-oriented analyses covering:

- Sales trends
- Customer segmentation
- Product performance
- Market opportunities
- Cost analysis
- Discount impact
- Freight costs
- Seasonal patterns
- Customer loyalty
- Forecast accuracy
- Channel performance
- Geographical sales
- Product mix
- Customer value
- Inventory analysis

Some requested business areas in the project brief do not have dedicated fields in the nine-table schema, so analysis for those areas is limited to the available data.

### Task 5 – Advanced SQL

Implemented advanced SQL concepts including:

- User Defined Functions (UDFs)
- Stored Procedures
- Triggers
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions
- `RANK()`
- `LAG()`
- `STRING_AGG()`
- `PIVOT`

### Task 6 – Forecast Accuracy

Compared forecasted quantity with actual sales at monthly and fiscal-year levels.

**Forecast Accuracy = Actual Sales ÷ Forecast Quantity × 100**

The analysis also compares forecast and actual quantities using a PIVOT-based report.

## Key Analytical Areas

- Sales Trend Analysis
- Customer Purchasing Behavior
- Product Performance
- Market & Regional Analysis
- Manufacturing Cost Analysis
- Freight Cost Analysis
- Discount Analysis
- Forecast Accuracy
- Inventory-related Analysis

## Actionable Insights

- Monitor products with consistently low sales performance.
- Review periods with low forecast accuracy.
- Monitor manufacturing and freight costs.
- Review high discount levels.
- Focus on markets with stronger forecasted demand.
- Use sales and forecast trends to support inventory planning.

## Tools & Technologies

- Microsoft SQL Server
- SQL
- CTEs
- Joins
- Aggregate Functions
- Subqueries
- Window Functions
- Stored Procedures
- User Defined Functions
- Triggers
- PIVOT
- STRING_AGG
- Date and Fiscal Year Functions

## Project Structure

```text
Finance-Supply-Chain-Analytics-SQL/
│
├── README.md
│
├── SQL/
│   ├── 01_Database_and_Tables.sql
│   ├── 02_Data_Insertion.sql
│   ├── 03_Task_3_Analysis.sql
│   ├── 04_Task_4_Business_Analysis.sql
│   ├── 05_Task_5_Advanced_SQL.sql
│   └── 06_Task_6_Forecast_Accuracy.sql
│
├── Documentation/
│   └── Finance_Supply_Chain_Analytics_Documentation.docx
│
└── Presentation/
    └── Finance-Supply-Chain-Analytics.pptx
```

## Conclusion

This project demonstrates how SQL can be used to organize and analyze finance and supply chain data. It provides a structured approach to understanding sales, customers, products, costs, and forecast performance.

---

**Project:** Finance & Supply Chain Analytics  
**Domain:** Finance & Supply Chain  
**Tool:** Microsoft SQL Server  
**Submitted By:** Vaishnavi Patil
