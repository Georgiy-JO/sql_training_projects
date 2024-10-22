WITH vis AS (
    SELECT name, COUNT(*)
    FROM person_visits JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
    GROUP BY name 
),
ord AS (
    SELECT name, COUNT(*)
    FROM person_order 
        JOIN menu ON person_order.menu_id=menu.id
        JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
    GROUP BY name 
),
vis_ord AS (
SELECT v.name, v.count AS total_count
FROM vis v
UNION ALL 
SELECT o.name, o.count AS total_count
FROM ord o
)
SELECT name, SUM(total_count) AS total_count FROM vis_ord
GROUP BY name 
ORDER BY total_count DESC, name;
