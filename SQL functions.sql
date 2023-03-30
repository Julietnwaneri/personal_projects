/*Group 7 members
Linda Owolabi
2.Juliet Nwaneri
3.Oluchukwu Chiadika
4.Mary Akinwola
5.Olajumoke Falawo
6.Nitaranda Alexander
7.Latifa Abubaka
8.Kehinde Famakinde
9.Kariman Ibrahim
10.Juliana Talai*/


select * from Breweries


Select SUM(Profit), countries
From Breweries
Group by Countries

/*Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/

Select Sum(profit) as total_profit,
CASE when Countries = 'Nigeria' or Countries = 'Ghana' then 'Anglophone'
else 'Francaphone'
End as Territories
From breweries
Group by Territories
Order by total_profit 

/*. Country that generated the highest profit in 2019*/
Select countries, sum(profit) as highest_profit
From breweries
where years = 2019
group by countries
order by highest_profit DESC
limit 5

/* Help him find the year with the highest profit*/
select years, sum(profit) as total_profit
from breweries
group by years
order by total_profit Desc

 /*Which month in the three years was the least profit generated?*/
 select months, sum(profit) as total_profit
 from breweries
 group by months
 order by total_profit 
 
/*What was the minimum profit in the month of December 2018?*/
select months, years, min(profit)as min_profit
from breweries
where months='December'
and years='2018'
group by months, years
order by min_profit


/*Compare the profit in percentage for each of the month in 2019*/
select months, sum(profit)as monthly_profit, round(sum(profit)*100/
(select sum(profit)from breweries where years='2019'),2)as profit_percentage
from breweries where years='2019'
group by months, years
order by profit_percentage

 /*Which particular brand generated the highest profit in Senegal*/
 select brands, countries, sum(profit) as total_profit
 from breweries
 group by brands, countries
 having countries='Senegal' 
 order by total_profit desc
 limit 1;
 
 /*brand analysis*/
 /* Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/

/* Find out the top two choice of consumer brands in Ghana*/
select brands, countries, sum(quantity) as highest_choice
from breweries
group by brands, countries
having countries='Ghana'
order by highest_choice
Limit 2;

/* Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa*/

select brands, countries, sum(Quantity) as Quantity_consumed
from breweries
where countries='Nigeria' and brands not like '%malt'
group by brands,countries
order by Quantity_consumed

/*Favorite malt brand in Anglophone region between 2018 and 2019*/
SELECT brands, countries, years, sum(Quantity) as Quantity_consumed
FROM breweries
WHERE countries IN ('Nigeria', 'Ghana')
AND years BETWEEN 2018 AND 2019
AND brands like '%malt'
GROUP BY brands, countries, years
ORDER BY SUM(Quantity) DESC

/*. Which brands sold the highest in 2019 in Nigeria?*/
select brands, countries, years, sum (Quantity) as Highest_sold
from breweries
where countries='Nigeria' and years='2019'
group by brands, countries, years
order by highest_sold

/*Favorites brand in South_South region in Nigeria*/
select brands, region, countries, sum(quantity)as favourite_brand_SS
FROM breweries
where countries = 'Nigeria'
and region='southsouth'
group by brands, countries, region
order by favourite_brand_SS DESC

/*Beer consumption in Nigeria*/
select brands, countries, sum(quantity)as beer_consumption_rate
from breweries
where countries='Nigeria'
and brands not like '%malt'
group by brands, countries
order by beer_consumption_rate

/* Level of consumption of Budweiser in the regions in Nigeria*/
select brands, countries, region, sum(quantity) as consumption_rate
from breweries
where countries='Nigeria'
and brands='budweiser'
group by brands, countries, region
order by consumption_rate desc


/*Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)*/
select brands, countries, region, years, sum(quantity) as consumption_rate
from breweries
where countries='Nigeria'
and brands='budweiser'
and years='2019'
group by brands, countries, region, years
order by consumption_rate desc

/*COUNTRIES ANALYSIS
1. Country with the highest consumption of beer.*/
select countries, brands, sum(quantity)as highest_consumption
from breweries
where brands not like '%malt'
group by brands, countries
order by countries, highest_consumption desc

/*Highest sales personnel of Budweiser in Senegal*/
SELECT sales_rep, SUM(quantity * unit_price) AS total_sales
FROM breweries
WHERE countries = 'Senegal' AND brands = 'budweiser'
GROUP BY sales_rep
ORDER BY total_sales DESC
LIMIT 1;

/*Country with the highest profit of the fourth quarter in 2019*/
select countries, years, months, sum(profit) as total_profit
from breweries
where years='2019'
and months IN ('October', 'November','December')
group by countries, months, years
order by total_profit




