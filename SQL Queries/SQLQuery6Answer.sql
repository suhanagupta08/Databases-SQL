SELECT TOP (1) WITH TIES a.shop_name,
		b.shop_id, 
		SUM(b.price * b.quantity) AS total_revenue

FROM		shops a,
		products_in_order b,
		orders c

WHERE	MONTH(c.ordered_date) = 8 AND YEAR(c.ordered_date) = 2020 
		AND b.order_id = c.order_id
		AND b.shop_id = a.shop_id

GROUP BY a.shop_name, b.shop_id
ORDER BY total_revenue DESC;
