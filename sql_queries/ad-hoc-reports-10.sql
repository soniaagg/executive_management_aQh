-- Report 10- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?
WITH cte1 AS (
			SELECT 
				p.division, p.product_code, 
                CONCAT(p.product," (", p.variant, ")") AS product, 
				sum(s.sold_quantity) total_sold_qty
			FROM fact_sales_monthly s
			JOIN dim_product p USING(product_code)
			WHERE fiscal_year = 2021
			GROUP BY product_code),
	cte2 AS (
			SELECT *,
			RANK() OVER(PARTITION BY division ORDER BY total_sold_qty DESC) rank_order 
			FROM cte1)
SELECT * FROM cte2
WHERE rank_order <=3;
