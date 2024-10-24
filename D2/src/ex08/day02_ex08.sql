SELECT person.name FROM person
    JOIN person_order ON person_order.person_id=person.id
    JOIN menu ON person_order.menu_id=menu.id
WHERE person.gender='male'
    AND (person.address='Moscow' OR person.address='Samara')
    AND (menu.pizza_name='mushroom pizza' OR menu.pizza_name='pepperoni pizza')
ORDER BY person.name DESC;