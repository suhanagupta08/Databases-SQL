SELECT DISTINCT	a.product_id

FROM	products_in_order a

WHERE	(SELECT	SUM(a1.quantity) 
		FROM		products_in_order a1,
				orders b1
		WHERE	MONTH(b1.ordered_date) = MONTH(GETDATE())-1 AND
				a1.order_id = b1.order_id AND 
				a1.product_id = a.product_id
		) > 
			
		(SELECT	SUM(a2.quantity) 
		FROM		products_in_order a2,
				orders b2
		WHERE	MONTH(b2.ordered_date) = MONTH(GETDATE())-2 AND
				a2.order_id = b2.order_id AND 
				a2.product_id = a.product_id
	) AND 

		(SELECT	SUM(a3.quantity) 
	FROM		products_in_order a3,
				orders b3
		WHERE	MONTH(b3.ordered_date) = MONTH(GETDATE())-2 AND
				a3.order_id = b3.order_id AND 
				a3.product_id = a.product_id
		) > 

		(SELECT	SUM(a4.quantity) 
		FROM		products_in_order a4,
				orders b4
	WHERE	MONTH(b4.ordered_date) = MONTH(GETDATE())-3 AND
				a4.order_id = b4.order_id AND 
				a4.product_id = a.product_id
		);
