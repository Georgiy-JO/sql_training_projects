-- output prices with discount and original prices
SELECT person.name, pizza_name, price, ROUND (price-price/100*discount) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order
    JOIN person ON person_order.person_id=person.id
    JOIN menu ON person_order.menu_id=menu.id
    JOIN person_discounts ON person_order.person_id=person_discounts.person_id
    JOIN pizzeria ON menu.pizzeria_id=pizzeria.id AND person_discounts.pizzeria_id=pizzeria.id
ORDER BY person.name, pizza_name;
    