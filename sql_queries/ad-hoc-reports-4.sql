-- Report 4- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
WITH cte1 as (
			SELECT segment, COUNT(DISTINCT product_code) unique_product_2020
			FROM fact_sales_monthly
            JOIN dim_product USING(product_code)
			WHERE fiscal_year=2020
            GROUP BY segment
           ),
cte2 as (            
			SELECT segment, COUNT(DISTINCT product_code) unique_product_2021
			FROM fact_sales_monthly
            JOIN dim_product USING(product_code)
			WHERE fiscal_year=2021
            GROUP BY segment
            )
SELECT 
	cte1.segment, unique_product_2020, unique_product_2021, 
	(unique_product_2021-unique_product_2020) difference
FROM cte1
JOIN cte2 USING (segment)
ORDER BY difference DESC;
