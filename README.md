<<<<<<< HEAD
# Credit Risk Analysis using SQL

## Overview

This project analyzes a loan dataset to understand key factors affecting loan default risk. The analysis is performed using SQL by aggregating borrower and loan characteristics.

## Objective

To identify patterns in borrower behavior and loan features that are associated with higher default rates.

## Dataset

* Source: Kaggle (loan/credit risk dataset)
* Contains borrower-level information such as:

  * Income
  * Loan amount
  * Interest rate
  * Loan status (default / non-default)
  * Home ownership
  * Credit history



##  Tools \& Technologies

\- PostgreSQL (SQL queries, joins, aggregations)

\- DBeaver / psql (database management)

\- GitHub (version control \& collaboration)



##  Repository Structure

\- `queries/` → SQL scripts for analysis

\- `data/` → Loan dataset

\- `results/` → Output tables, aggregated metrics

\- `README.md` → Project overview

## File Structure

credit-risk-sql-analysis/
│
├── sql/              # SQL scripts
│   ├── analysis.sql
│   ├── default_predictor.sql
│   └── copy_loans_from_CSV.sql
│
├── data/             # Raw datasets
│   └── credit_risk_dataset.csv
│
├── results/          # Output tables, reports
│   └── result.xlsx
│
├── docs/             # Notes & documentation
│   └── Credit Risk Analysis using SQL.txt
│
├── README.md         # Project overview
└── .gitignore        # Ignore unnecessary files (e.g., desktop.ini)



## Key Analyses Performed

### 1\. Overall Default Rate

* Calculated percentage of loans that resulted in default

### 2\. Income vs Default

* Compared average income across default and non-default groups
* Created income buckets:

  * Low Income
  * Middle Income
  * High Income

### 3\. Loan Amount Analysis

* Average loan amount by loan status
* Share of total loan amount across categories

### 4\. Loan Burden Analysis

* Categorized borrowers based on loan-to-income ratio:

  * Low burden
  * Medium burden
  * High burden

### 5\. Credit History Impact

* Compared default rates for:

  * Borrowers with past defaults
  * Borrowers without past defaults

### 6\. Interest Rate Analysis

* Grouped loans into:

  * Low interest
  * Medium interest
  * High interest
* Observed variation in default rates across groups

### 7\. Home Ownership Analysis

* Compared default rates across:

  * Rent
  * Mortgage
  * Own

### 8\. Combined Risk Segmentation

* Created multi-factor grouping using:

  * Income bucket
  * Loan burden
  * Past default history
  * Home ownership
  * Interest rate
* Calculated default rates for each segment to identify high-risk borrower profiles

## Key Insights

* Borrowers with higher loan burden (loan-to-income ratio) show higher default rates
* Past default history is a strong indicator of future default
* Lower income groups tend to have higher default percentages
* Interest rate groups show variation in risk, but may reflect lender pricing strategy rather than borrower quality

## Next Steps

* Extend analysis using Python (Pandas) for deeper exploration
* Build a logistic regression model for default prediction
* Compare statistical vs ML-based models

## Note

This project focuses on analytical understanding of risk drivers, not just querying data. It is an initial step toward building credit risk models and forecasting systems.

=======
# credit-risk-sql-analysis
This project analyzes a loan dataset to understand key factors affecting loan default risk. The analysis is performed using SQL by aggregating borrower and loan characteristics.
>>>>>>> 6c070115492fb76d2c41e6bbefb408f4a72d16e3
