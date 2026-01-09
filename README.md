# 🌍 Global Plastic Waste & The Burden Shift (ESG Analysis)
<img width="auto" height="auto" alt="A dark purple banner titled: WHERE HAS OUR PLASTIC WASTE ENDED UP? featuring a crumpled plastic bottle on the left and a plastic cup on the right, with the subtitle: GLOBAL PLASTIC WASTE & THE BURDEN SHIFT: ESG Analysis." src="https://github.com/user-attachments/assets/a8d955b5-085e-4d71-aa49-c3bab2de311c" />

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
```
SELECT country, 
	pg.per_capita_kg_per_day,
	RANK() OVER(ORDER BY per_capita_kg_per_day DESC) AS waste_rank
FROM plastic_generation pg 
GROUP BY country, per_capita_kg_per_day
ORDER BY waste_rank
LIMIT 10;
```

### 2. The "Waste Hubs" (The Netherlands & Germany)
An interesting trend emerged: **The Netherlands and Germany appear in the Top 10 for both Imports and Exports.** This indicates these nations act as global processing and transit hubs—importing waste to sort or recycle before re-exporting it.
```
SELECT country, 
	SUM(weight_kg) / 1000 AS total_tonnes_imported
FROM plastic_trade
WHERE flow = 'Export'
AND weight_kg IS NOT NULL
GROUP BY country 
ORDER BY total_tonnes_imported DESC
LIMIT 10;
```

### 3. The Major Importers
**Türkiye** and **Malaysia** have emerged as the primary destinations for global plastic waste. This highlights a "Burden Shift," where waste from industrialized nations is managed by countries with developing waste infrastructures.
```
SELECT country, 
	SUM(weight_kg) / 1000 AS total_tonnes_imported
FROM plastic_trade
WHERE flow = 'Import'
AND weight_kg IS NOT NULL
GROUP BY country 
ORDER BY total_tonnes_imported DESC
LIMIT 10;
```

<img width="250" height="auto" alt="A treemap chart titled Where the Waste Starts: Top Plastic Exporters identifying Japan as the world leader in plastic waste exports at over 683 million kg, followed by the Netherlands (551 million kg) and Belgium (362 million kg), while noting that most waste in these regions is still managed domestically." src="https://github.com/user-attachments/assets/e10ac96c-e974-4330-a424-24465b8dc193" />
<img width="250" height="auto"  alt="A treemap chart titled The World's Leading Plastic Importers showing that Türkiye is the top destination with over 677 million kg of plastic waste, followed by Germany (523 million kg) and the Netherlands (483 million kg), highlighting that Türkiye is the primary destination for European plastic waste." src="https://github.com/user-attachments/assets/79d0be3f-47e9-4ef6-b52d-e327b6455c21" />




---
### 👤 Contact 
- Eliza C. Huang | Data Analyst with a background in UX research and data-driven analysis.  
Interested in roles within public policy, NGOs, human rights, and social impact organizations.
- **Portfolio / Data Visualizations:** [Instagram – DataDrawers](https://www.instagram.com/datadrawers/)  
- **LinkedIn:** [https://www.linkedin.com/in/chuyunh/]  
