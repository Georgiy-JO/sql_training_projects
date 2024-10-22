SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
JOIN person ON person_visits.person_id=person.id
JOIN menu ON pizzeria.id=menu.pizzeria_id
WHERE 
    person.name ='Dmitriy' AND
    person_visits.visit_date=DATE'2022-01-08' AND
    menu.price<800;
    