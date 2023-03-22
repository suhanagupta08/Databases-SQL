SELECT product_id, ROUND(AVG(CAST(rating AS float)), 2) AS average_rating
FROM rates
WHERE MONTH(date_time) = 8 AND YEAR(date_time) = 2020
	    AND product_id IN (SELECT product_id
							FROM rates
							WHERE MONTH(date_time) = 8 AND YEAR(date_time) = 2020
		  						  AND rating = 5
							GROUP BY product_id
							HAVING COUNT(rating) >= 100)
GROUP BY product_id
ORDER BY average_rating;