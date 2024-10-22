--#1 IN ver.
SELECT name FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

--#2 EXISTS ver.
SELECT name FROM pizzeria
WHERE NOT EXISTS 
    (SELECT * FROM person_visits  --, pizzeria   -- that won't work
    WHERE pizzeria.id = person_visits.pizzeria_id);