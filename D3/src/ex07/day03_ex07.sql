INSERT INTO menu (
    id,
    pizzeria_id,
    pizza_name,
    price)
VALUES (
    (SELECT MAX(id) FROM menu)+1,
    2,
    'greek pizza',
    800);
