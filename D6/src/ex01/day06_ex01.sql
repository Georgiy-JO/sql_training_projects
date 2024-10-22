-- insert values into the table
INSERT INTO person_discounts (
    id,
    person_id,
    pizzeria_id,
    discount
)
WITH order_number AS(
        SELECT COUNT(*) AS n,person_id, pizzeria_id  FROM person_order 
        JOIN menu ON person_order.menu_id=menu.id 
        GROUP BY person_id, pizzeria_id)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY order_number.person_id) AS id,
    order_number.person_id AS person_id,
    order_number.pizzeria_id AS pizzeria_id,
    (CASE
        WHEN order_number.n=0 THEN 0
        WHEN order_number.n=1 THEN 10.5
        WHEN order_number.n=2 THEN 22
        ELSE 30
    END) AS discount
FROM order_number;