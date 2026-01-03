# 🌍 Global Plastic Waste & The Burden Shift (ESG Analysis)

## 📌 Project Overview
This project analyzes the global landscape of plastic waste, focusing on two questions:
- Which countries produce the most plastic waste per person?
- Which countries act as the primary importers and exporters of the global plastic scrap?

## 🛠️ Data Source
-**Database:** PostgreSQL
-**Tool:** DBeaver (GUI for schema setup and SQL execution), Excel
-**Data Sources:** * *Our World in Data (OWID)*: Plastic waste per capita.
-**UN Comtrade**: Plastic waste trade flows (HS Code 3915).


## 🔍 Analytical Steps
### 1. Data Cleaning & Database Setup
* **Normalization:** Standardized country names between the OWID and UN Comtrade datasets to ensure accurate joins.
* **Handling Nulls:** Utilized `is not NULL` filters to ensure volume totals only included verified trade records.
* **Schema Design:** Tables were created using DBeaver’s GUI, defining specific data types for precision (`NUMERIC` for weight and waste metrics).

### 2. SQL Analysis
The analysis was divided into three core queries to identify the leading actors in the plastic lifecycle.

---

## 📊 Key Insights

### 1. The Per-Capita Leaders
Small island nations (Antigua and Barbuda, Saint Kitts) and high-income oil-exporting nations (Kuwait) lead the world in per-capita plastic generation. This is often due to high tourism-to-population ratios and a heavy reliance on imported packaged goods.

### 2. The "Waste Hubs" (The Netherlands & Germany)
An interesting trend emerged: **The Netherlands and Germany appear in the Top 10 for both Imports and Exports.** This indicates these nations act as global processing and transit hubs—importing waste to sort or recycle before re-exporting it.

### 3. The Major Importers
**Türkiye** and **Malaysia** have emerged as the primary destinations for global plastic waste. This highlights a "Burden Shift," where waste from industrialized nations is managed by countries with developing waste infrastructures.

---
### 👤 Contact 
- Eliza C. Huang | Data Analyst with a background in UX research and data-driven analysis.  
Interested in roles within public policy, NGOs, human rights, and social impact organizations.
- **Portfolio / Data Visualizations:** [Instagram – DataDrawers](https://www.instagram.com/datadrawers/)  
- **LinkedIn:** [https://www.linkedin.com/in/chuyunh/]  