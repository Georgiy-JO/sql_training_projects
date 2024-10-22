SELECT menu.pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name,
    person_visits.visit_date
FROM menu
    JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
    JOIN person_visits ON person_visits.pizzeria_id=menu.pizzeria_id
    JOIN person ON person.id=person_visits.person_id
WHERE person.name = 'Kate'
    AND menu.price <= 1000 AND menu.price>=800
ORDER BY pizza_name, price,pizzeria_name;