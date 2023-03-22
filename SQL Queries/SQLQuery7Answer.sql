SELECT TOP (1) WITH TIES
U.user_id, U.name, COUNT(C.complaint_id) as num_of_complaints
INTO #max_comp
FROM users U, complaints C
WHERE 
	U.user_id = C.user_id
GROUP BY U.user_id, U.name
ORDER BY num_of_complaints DESC;

SELECT 
	M.user_id, M.name, P.product_name, I.product_id, I.price
INTO #all_prod
FROM #max_comp M, products P, products_in_order I, orders O 
WHERE 
	M.user_id=O.user_id
	AND I.order_id = O.order_id
	AND I.product_id=P.product_id;

SELECT 
	A.user_id, A.name, A.product_name, A.product_id, A.price
FROM #all_prod A
WHERE A.price =
	(SELECT MAX(B.price)
	FROM #all_prod B
	WHERE B.user_id = A.user_id);

DROP TABLE #max_comp;
DROP TABLE #all_prod;
