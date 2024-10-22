WITH vis AS (
    SELECT name, COUNT(*), 'visit' AS action_type
    FROM person_visits JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
    GROUP BY name 
    ORDER BY count DESC
    LIMIT 3
),
ord AS (
    SELECT name, COUNT(*), 'order' AS action_type
    FROM person_order 
        JOIN menu ON person_order.menu_id=menu.id
        JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
    GROUP BY name 
    ORDER BY count DESC
    LIMIT 3
)

SELECT v.name, v.count, v.action_type
FROM vis v
UNION
SELECT o.name, o.count, o.action_type
FROM ord o
ORDER BY action_type ASC, count DESC;