# Global Plastic Waste & The Burden Shift (ESG Analysis)
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
Small island nations like Antigua and Barbuda and St Kitts produce far more plastic waste per person than most countries. They get many more tourists than residents, and visitors create much more trash, especially from single‑use plastics like bottles, takeout containers, and hotel supplies. These islands also import almost everything they use, and nearly all of it arrives in plastic packaging.

Wealthy oil exporters such as Kuwait show a similar pattern: high incomes and heavy consumption mean people use a lot of packaged, often imported goods.

In big countries like the U.S., China, or India, total plastic waste is huge, but the per‑person number is lower because their populations are so large. In tiny, tourism‑driven islands and rich Gulf states, small populations plus heavy imports and high consumption create very high per‑capita plastic waste, even though their overall share of the world’s plastic is small.
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

The Netherlands is a re‑export hub because most goods arrive at ports like Rotterdam, are stored or lightly processed, then shipped on to the rest of Europe. About half of its “exports” are just goods passing through, so high import and export numbers reflect its role as Europe’s logistics gateway.

Germany is an export‑driven manufacturing economy. It makes high‑value products like cars, machinery, and chemicals and sells them worldwide. It also imports large volumes of parts and raw materials to feed its factories, so it ranks high for both imports and exports.

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
Türkiye and Malaysia are now the top destinations for exported plastic waste, they are so called a “burden shift” after China’s 2018 ban,China banned most plastic waste imports In 2025, therefore, the EU sent over 500,000 tonnes of plastic waste to Türkiye, and the UK sent about 139,000 tonnes. Both countries have large recycling sectors, but in places like Adana (Türkiye) and Kuala Langat (Malaysia), weak oversight and high volumes lead to illegal dumping, burning, and serious pollution.
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

<img width="450" height="auto" alt="A treemap chart titled Where the Waste Starts: Top Plastic Exporters identifying Japan as the world leader in plastic waste exports at over 683 million kg, followed by the Netherlands (551 million kg) and Belgium (362 million kg), while noting that most waste in these regions is still managed domestically." src="https://github.com/user-attachments/assets/e10ac96c-e974-4330-a424-24465b8dc193" />
<img width="450" height="auto"  alt="A treemap chart titled The World's Leading Plastic Importers showing that Türkiye is the top destination with over 677 million kg of plastic waste, followed by Germany (523 million kg) and the Netherlands (483 million kg), highlighting that Türkiye is the primary destination for European plastic waste." src="https://github.com/user-attachments/assets/79d0be3f-47e9-4ef6-b52d-e327b6455c21" />




---
## 👤 Contact
**Eliza C. Huang**  
Data Analyst with a background in UX and data-driven analysis. Interested in high-impact roles across **Public Policy, NGOs, Human Rights**, as well as industries such as **Technology, Supply Chain & Logistics, Healthcare, Sustainability, and FinTech**.
- 📊 Tableau Public: https://public.tableau.com/app/profile/eliza.c.huang/vizzes  
- 💼 LinkedIn: https://www.linkedin.com/in/chuyunh/  
- 📸 Instagram: DataDrawers — https://www.instagram.com/datadrawers/  
