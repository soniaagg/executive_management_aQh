-- Report 7-Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. 
SELECT 
	monthname(s.date) as month_name, s.fiscal_year, 
    ROUND(SUM(s.sold_quantity * g.gross_price/1000000), 2) as gross_sales_mln
FROM fact_sales_monthly s
JOIN dim_customer c 
USING (customer_code)
JOIN fact_gross_price g 
USING(product_code, fiscal_year)
WHERE customer = "Atliq Exclusive"
GROUP BY month_name, s.fiscal_year 
ORDER BY fiscal_year, gross_sales_mln DESC;
