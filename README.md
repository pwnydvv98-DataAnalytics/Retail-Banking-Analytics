# Retail Banking Analytics & Risk Intelligence Suite

An end-to-end data analytics and business intelligence project converting multi-table relational banking data into actionable executive insights. Built using **MySQL** for schema modeling, normalization, and data cleaning, and **Microsoft Power BI** with custom **DAX** for financial risk modeling, operational metrics, and interactive dashboard design.

---

## 📌 Project Overview

This project analyzes the financial health, credit risk, digital channel performance, and workforce efficiency of a retail banking institution operating across national branches.

### Key Metrics at a Glance:
* **Customer Base:** 100,000 Unique Customers
* **Total Deposits (Balance):** ₹317.80 Billion
* **Total Active Loan Book:** ₹198.44 Billion (~62.4% Loan-to-Deposit Ratio)
* **Transaction Throughput:** ₹147.22 Billion
* **Physical Footprint:** 1,000 Branches across India
* **Workforce:** 10,000 Employees (₹992.10M Total Payroll Expense)

---

## 🗄️ Dataset Architecture & Data Dictionary

The project is built on a relational banking dataset comprising 6 core cleaned tables:

| Table Name | Primary Key | Foreign Keys / Linkages | Description & Core Attributes | Record Count |
|---|---|---|---|---|
| **`branches_clean`** | `Branch_ID` | None | Physical branch network details (`Branch_Name`, `Branch_Manager`, `City`, `State`). | 1,000 |
| **`customer_clean`** | `Customer_ID` | `Branch_ID` | Demographics and client profile data (`Customer_Name`, `Age`, `Gender`, `City`, `State`). | 100,000 |
| **`account_clean`** | `Account_ID` | `Customer_ID`, `Branch_ID` | Account balances and status (`Account_Type`, `Balance`, `Account_Status`, `Opening_Date`). | 130,000 |
| **`transactions_clean`** | `Transaction_ID` | `Account_ID` | Payment throughput and channel logs (`Amount`, `Channel`, `Transaction_Date`, `Transaction_Status`). | 500,000+ |
| **`loans_clean`** | `Loan_ID` | `Customer_ID` | Credit distribution and delinquency records (`Loan_Type`, `Loan_Amount`, `Interest_Rate`, `Loan_Status`). | 80,000 |
| **`employees_clean`** | `Employee_ID` | `Branch_ID` | Staffing levels, roles, and payroll expenditures (`Position`, `Salary`, `Joining_Date`). | 10,000 |

---

## 🛠️ Tech Stack & Architecture

* **Database & SQL:** MySQL Workbench 8.0 (Data cleaning, handling duplicates, constraints, aggregation)
* **Business Intelligence:** Microsoft Power BI Desktop & Service
* **Modeling & Calculations:** Advanced DAX (Data Analysis Expressions) & Star/Snowflake Schema
* **UX/UI:** Interactive Page Navigator, Slicers, Custom Executive Theme (#0F1E36 Navy Blue)

---

## 📂 Repository Structure

```text
├── power_bi/
│   └── Final Bank Analysis Report.pbix
├── sql work/
│   ├── Data&Business Analysis.sql
│   ├── Data_Cleaning.sql
│   ├── Table Uploads.sql
│   └── (clean CSV datasets)
├── screenshots/
│   ├── page1_overview.png
│   ├── page2_customer.png
│   ├── page3_loans.png
│   └── page4_branch.png
└── README.md
```
---
## 📊 Dashboard Modules
### 1. Executive Overview
* High-level summary of total deposits (₹317.80B), total loans (₹198.44B), and transaction volume (₹147.22B).
* Transaction channel distribution: Mobile App (22.25%), ATM (22.20%), UPI (11.09%), Branch (11.07%).
* 4-year transaction trajectory (2022–2025 surge).
### 2. Customer Intelligence & Demographics
* Age segmentation (Core base: 41–60 years with 34.35K customers; under-25 with 10.58K).
* Gender balance and card type distribution (Debit, Credit, Prepaid).
* Top deposit-generating accounts and average balance tiering.
### 3. Loan Portfolio & Risk Analysis
* Lending exposure across 5 categories: Car, Personal, Business, Education, and Home Loans (~20% distribution each).
* Identification of default risk hotspots (Portfolio default rate: 16.57%; highest in Home Loans at 16.89% and Education * Loans at 16.84%).
### 4. Branch Performance & Operational Intelligence
* Staffing efficiency (optimized ratio of 10.0 employees per branch).
* Top cities by total balance led by Lucknow (₹21.69B), Indore (₹19.82B), and Chandigarh (₹19.81B).
* Compensation and headcount breakdown across designations (Assistant Managers, Managers, Officers, Senior Officers, Clerks, Relationship Managers).
---
## 📐 Data Schema & Core DAX Measures
```dax
-- Default Rate Percentage
Default Rate % = 
DIVIDE(
    CALCULATE(COUNTROWS('banking_clean loans_clean'), 'banking_clean loans_clean'[Loan_Status] = "Defaulted"),
    COUNTROWS('banking_clean loans_clean'),
    0
)

-- Transaction Success Rate
Success Rate % = 
DIVIDE(
    CALCULATE(COUNTROWS('banking_clean transactions_clean'), 'banking_clean transactions_clean'[Transaction_Status] = "Success"),
    COUNTROWS('banking_clean transactions_clean'),
    0
)

-- Branch Staffing Density
Avg Employees per Branch = 
DIVIDE([Total Employees], [Total Branches], 0)

-- Cross-Entity Branch Loan Aggregation
Total Loan Amount = 
CALCULATE(
    SUM('banking_clean loans_clean'[Loan_Amount]),
    CROSSFILTER(
        'banking_clean customer_clean'[Customer_ID], 
        'banking_clean account_clean'[Customer_ID], 
        Both
    )
)
```
---
## 💡 Key Business Findings & Recommendations
* **Transaction Gateway Reliability:** A 42.94% transaction success rate indicates critical drop-offs in payment switches/UPI paths that require infrastructure upgrades.
* **Mortgage & Education Credit Underwriting:** Default rates peak in Home Loans (16.89%) and Education Loans (16.84%), suggesting a need for tighter collateral appraisal and co-signer verification.
* **Youth Segment Acquisition:** Under-25 customers represent only 10.58% of the active customer base, presenting a growth opportunity for student-focused digital products.
* **Branch Resource Optimization:** Capitalize on top deposit cities (Lucknow, Indore, Chandigarh) by expanding wealth management and premium banking services.
---
## 🚀 How to Run the Project Locally

1.Clone the repository:
git clone https://github.com/pwnydvv98-DataAnalytics/Retail-Banking-Analytics.git

2.Load Database:
Open MySQL Workbench.
Run the SQL scripts inside the sql work/ directory to set up schema and load data.

3.Open Dashboard:
Open power_bi/Final Bank Analysis Report.pbix in Power BI Desktop.
Refresh data connection to point to your local MySQL instance.
