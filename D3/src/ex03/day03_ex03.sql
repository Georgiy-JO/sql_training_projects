WITH f_visit AS(
    SELECT pizzeria.name AS pizza_name, COUNT(pizzeria.name) AS visit_amount FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
        JOIN person ON person.id=person_visits.person_id
    WHERE person.gender='female'
    GROUP BY pizza_name
),
m_visit AS(
    SELECT pizzeria.name AS pizza_name, COUNT(pizzeria.name) AS visit_amount FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
        JOIN person ON person.id=person_visits.person_id
    WHERE person.gender='male'
    GROUP BY pizza_name
)
SELECT pizza_name FROM 
    (SELECT * FROM f_visit
    EXCEPT ALL
    SELECT * FROM m_visit) AS result_pile
ORDER BY pizza_name;
