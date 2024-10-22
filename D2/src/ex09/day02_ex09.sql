WITH cheese_id AS (
    SELECT person_id FROM person_order
    JOIN menu ON person_order.menu_id=menu.id
    WHERE menu.pizza_name='cheese pizza'),
peppironi_id AS (
    SELECT person_id FROM person_order
    JOIN menu ON person_order.menu_id=menu.id
    WHERE menu.pizza_name='pepperoni pizza')

SELECT person.name FROM person
JOIN cheese_id ON cheese_id.person_id=person.id
JOIN peppironi_id ON peppironi_id.person_id=person.id
WHERE gender='female' 
    AND cheese_id.person_id=peppironi_id.person_id
ORDER BY name;


