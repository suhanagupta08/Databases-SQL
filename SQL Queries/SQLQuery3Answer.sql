SELECT 	AVG(DATEDIFF(DAY, a.ordered_date, b.delivery_date)) AS average_time

FROM 		orders a, 
		products_in_order b

WHERE 	MONTH(a.ordered_date) = 6 AND
		YEAR(a.ordered_date) = 2020 AND
		b.delivery_date IS NOT NULL AND
		a.order_id = b.order_id;
