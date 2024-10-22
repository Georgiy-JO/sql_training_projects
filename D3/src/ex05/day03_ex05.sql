WITH visited AS(
    SELECT pizzeria.name AS pizzeria_name, person_visits.person_id AS person_id 
    FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id=pizzeria.id
    ),
ordered AS(
    SELECT pizzeria.name AS pizzeria_name, person_order.person_id AS person_id 
    FROM person_order
        JOIN menu ON person_order.menu_id=menu.id
        JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
    )
SELECT pizzeria_name FROM 
(SELECT * FROM visited
EXCEPT
SELECT * FROM ordered) AS visit_no_buy
WHERE person_id=(SELECT id FROM person WHERE person.name='Andrey')
ORDER BY pizzeria_name;