WITH f_visit AS(
    SELECT pizzeria.name AS pizza_name FROM person_order
        JOIN menu ON person_order.menu_id=menu.id
        JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
        JOIN person ON person_order.person_id=person.id
    WHERE person.gender='female'
    GROUP BY pizzeria.name
),
m_visit AS(
    SELECT pizzeria.name AS pizza_name FROM person_order
        JOIN menu ON person_order.menu_id=menu.id
        JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
        JOIN person ON person_order.person_id=person.id
    WHERE person.gender='male'
    GROUP BY pizzeria.name
)
(SELECT * FROM f_visit EXCEPT SELECT * FROM m_visit)
UNION
(SELECT * FROM m_visit EXCEPT SELECT * FROM f_visit)
ORDER BY pizza_name;