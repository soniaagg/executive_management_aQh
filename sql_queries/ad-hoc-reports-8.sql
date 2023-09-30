-- Report 8-In which quarter of 2020, got the maximum total_sold_quantity?
SELECT 
	concat("Qtr ", QUARTER(s.date + interval 4 month)) as quarter,
	SUM(s.sold_quantity) as total_sold_quantity 
FROM fact_sales_monthly s
WHERE fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC; 
