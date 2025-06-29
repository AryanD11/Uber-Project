# 🚖 Uber Data Analysis Project

## 📌 Overview

This project presents a **comprehensive data analysis of Uber ride data** for Delhi, India. The project covers the **entire data lifecycle**—from **data generation** to **data cleaning**, **SQL-based analysis**, and **visualizations in Power BI**.

It demonstrates a **real-world data analyst workflow**, including working with **dirty data**, performing **data cleaning in Excel & MySQL**, writing **SQL queries** for analysis, and building an **interactive dashboard** in Power BI.

---

## 📂 Dataset Information

- **Total Rows:** 90,000
- **Location Covered:** Delhi, India
- **Time Period:** 2022–2023
- **Features:**
  - Date & Time
  - Booking ID, Status, Customer & Driver Ratings
  - Pickup & Drop Locations
  - Booking Value, Ride Distance, Payment Method
  - Cancellation & Incompletion Reasons

---

## 🧹 Data Cleaning Process

**1️⃣ Excel Cleaning (Uber Dataset Cleaned.csv):**
- Started with **Uber Dirty Dataset.csv**
- Removed duplicates (1,157 rows)
- Fixed typos in Vehicle Type & Payment Method
- Trimmed whitespace errors
- Fixed invalid dates (future and out-of-range)
- Corrected inconsistent cancellation reasons
- **Saved cleaned version as → Uber Dataset Cleaned.csv**

**2️⃣ SQL Cleaning (Uber_data.csv):**
- Imported `Uber Dataset Cleaned.csv` into **MySQL**
- Performed further filtering and formatting using SQL queries
- Exported as `Uber_data.csv` → used for SQL queries and Power BI dashboard

📄 **Full details in →** `Documentation/Project_Report.docx`

---

## 🗃 SQL Analysis

**Examples of SQL analysis performed:**
- Retrieve all bookings where Booking Value > ₹1000
- Find total bookings for each Vehicle Type
- Get percentage of bookings by Payment Method
- List top customers by total spend
- Revenue analysis grouped by month and payment type

📄 **Full SQL Queries + Answers →** `SQL/SQL_Answers.pdf`

---

## 📊 Power BI Dashboard

**Highlights of Dashboard Visuals:**
- Ride Volume Over Time
- Booking Status Breakdown
- Revenue by Payment Method
- Cancellations by Reason
- Ratings by Vehicle Type
- Top Customers by Revenue

📄 **Dashboard overview & layout →** `PowerBI/Dashboard_Layout.pptx`  
📄 **Power BI Questions + Answers →** `PowerBI/PowerBI_Answers.pdf`

---

## 🚀 How to Use

1. Clone/download this repository.
2. **Start with `Uber Dirty Dataset.csv` → Clean it in Excel → Save as `Uber Dataset Cleaned.csv`.**
3. Import `Uber Dataset Cleaned.csv` into **MySQL** → Perform SQL cleaning → Export as `Uber_data.csv`.
4. Load `Uber_data.csv` into **MySQL or any SQL interface** to run analysis queries.
5. Open `Uber_Dashboard.pbix` in **Power BI** to explore the dashboard visuals.
6. Refer to `Documentation/` for detailed explanation, requirements, and report.

---

## ✨ Highlights of This Project

- Demonstrates **practical, real-world data analysis** workflow
- Covers **data cleaning, SQL analysis, and visualization**
- Provides **full traceability** from dirty data → cleaned data → analysis → dashboard
- Structured and documented clearly for professional review

---

## 📎 Credits

- **Project by:** Aryan Dave  
- **Data Generated Using:** ChatGPT + Python scripts  
- **Analysis Tool:** MySQL  
- **Visualization Tool:** Power BI

---
