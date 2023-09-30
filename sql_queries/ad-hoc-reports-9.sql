-- Report 9- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
WITH cte1 as (
			SELECT 
			c.channel,
			round(SUM(s.sold_quantity * g.gross_price)/1000000, 2) as gross_sales_mln
			FROM gdb023.fact_sales_monthly s
			JOIN dim_customer c USING (customer_code)
			JOIN fact_gross_price g USING(product_code, fiscal_year)
			WHERE fiscal_year = 2021
			GROUP BY c.channel),
cte2 as (
			SELECT round(sum(gross_sales_mln),2) tgs 
			FROM cte1 )
SELECT channel, gross_sales_mln, round(gross_sales_mln*100/tgs, 2)  percentage
FROM cte1, cte2
ORDER BY gross_sales_mln DESC;