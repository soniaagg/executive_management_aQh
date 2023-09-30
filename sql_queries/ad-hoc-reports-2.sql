-- Report 2- What is the percentage of unique product increase in 2021 vs. 2020?
with cte1 as (
			SELECT COUNT(DISTINCT product_code) unique_product_2020
			FROM fact_sales_monthly
			WHERE fiscal_year=2020),
	cte2 as (
			SELECT COUNT(DISTINCT product_code) unique_product_2021
			FROM fact_sales_monthly
			WHERE fiscal_year=2021),
	cte3 as (
			SELECT ((unique_product_2021-unique_product_2020)*100/unique_product_2020) percentage_chg
			FROM cte1
			JOIN cte2  )
SELECT unique_product_2020, unique_product_2021, 
round(percentage_chg,2) percentage_chg 
FROM cte1,cte2,cte3;