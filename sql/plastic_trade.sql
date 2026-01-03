--- Query 1 Rank Top 10 countries per capita kg per day
select country, 
	pg.per_capita_kg_per_day,
	rank() over(order by per_capita_kg_per_day DESC) as waste_rank
from plastic_generation pg 
group by country, per_capita_kg_per_day
order by waste_rank
limit 10;

--- Query 2 TOP 10 countries import plastic waste
select country, 
	SUM(weight_kg) / 1000 AS total_tonnes_imported
from plastic_trade
where flow = 'Import'
and weight_kg is not NULL
group by country 
order by total_tonnes_imported DESC
limit 10;

--- Query 3 TOP 10 countries export plastic waste
select country, 
	SUM(weight_kg) / 1000 AS total_tonnes_imported
from plastic_trade
where flow = 'Export'
and weight_kg is not NULL
group by country 
order by total_tonnes_imported DESC
limit 10;

