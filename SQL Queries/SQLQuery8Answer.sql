SELECT DISTINCT product_id
INTO #products_not_all_purchased
FROM products_in_order PIO1
WHERE EXISTS(SELECT U.user_id
	     FROM users U
	     WHERE NOT EXISTS (SELECT *
			       FROM products_in_order PIO2, orders O2
			       WHERE PIO2.product_id = PIO1.product_id
				     AND O2.user_id = U.user_id
				     AND O2.order_id = PIO2.order_id
			       )	
	     );

SELECT TOP (5) WITH TIES 
	PIO.product_id, SUM(quantity) AS  total_quantity
FROM products_in_order PIO, orders O
WHERE MONTH(ordered_date) = 8 AND YEAR(ordered_date) = 2020
      AND PIO.product_id IN (SELECT product_id
							FROM #products_not_all_purchased)
	  AND O.order_id = PIO.order_id
GROUP BY PIO.product_id
ORDER BY total_quantity;

DROP TABLE #products_not_all_purchased;

