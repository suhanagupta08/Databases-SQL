SELECT TOP (1) WITH TIES
	E.employee_id, E.name, AVG(CAST(C.addressed_date_time-C.filed_date_time AS float)) AS avg_latency
FROM
	complaints C, employees E
WHERE
	E.employee_id = C.employee_id
	AND C.status_id = 7
GROUP BY E.employee_id, E.name
ORDER BY avg_latency ASC;



