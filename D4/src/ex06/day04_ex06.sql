CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
    JOIN person ON person_visits.person_id=person.id
    JOIN menu ON pizzeria.id=menu.pizzeria_id
WHERE 
    person.name ='Dmitriy' AND
    person_visits.visit_date=DATE'2022-01-08' AND
    menu.price<800;

-- to check:
-- MATERIALIZED VIEW:
SELECT * FROM mv_dmitriy_visits_and_eats;
-- Just the query:
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
    JOIN person ON person_visits.person_id=person.id
    JOIN menu ON pizzeria.id=menu.pizzeria_id
WHERE 
    person.name ='Dmitriy' AND
    person_visits.visit_date=DATE'2022-01-08' AND
    menu.price<800;