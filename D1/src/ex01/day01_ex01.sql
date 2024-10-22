SELECT * FROM 
(SELECT name FROM person ORDER BY name) AS object_name 
UNION ALL
SELECT * FROM
(SELECT pizza_name FROM menu ORDER BY pizza_name) AS object_name;