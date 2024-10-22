-- Insert new Dmitriy's visit
INSERT iNTO person_visits (
    id,
    person_id,
    pizzeria_id,
    visit_date
)
SELECT 
    (SELECT MAX(id) FROM person_visits)+1,
    (SELECT id FROM person WHERE name='Dmitriy'),
    (SELECT pizzeria.id FROM pizzeria 
        JOIN menu ON menu.pizzeria_id=pizzeria.id 
        WHERE pizzeria.name NOT IN (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats) 
        AND menu.price < 800 
        ORDER BY RANDOM() LIMIT 1),
    DATE'2022-01-08';

-- Update the materialized vies mv_dmitriy_visits_and_eats
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- Check the materialized vies
SELECT * FROM mv_dmitriy_visits_and_eats;
