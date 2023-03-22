SELECT 
	AVG(R.price) AS avg_price
FROM 
products P, records R
WHERE 
	P.product_name = 'iPhone Xs'
	AND P.product_id = R.product_id
	AND (R.start_date BETWEEN '2020-08-01' AND '2020-08-31'
		OR R.end_date BETWEEN '2020-08-01' AND '2020-08-31'
		OR (R.start_date < '2020-08-01' AND (R.end_date > '2020-08-31' OR R.end_date IS NULL)));

