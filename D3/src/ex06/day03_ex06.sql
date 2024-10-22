WITH pizza_table AS 
    (SELECT menu.pizza_name,pizzeria.name, menu.price
    FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
SELECT DISTINCT pizza_table_1.pizza_name, pizza_table_1.name AS pizzeria_name_1, pizza_table_2.name AS pizzeria_name_2, pizza_table_1.price
FROM pizza_table AS pizza_table_1 
CROSS JOIN pizza_table AS pizza_table_2
WHERE pizza_table_1.name<pizza_table_2.name
    AND pizza_table_1.price=pizza_table_2.price
    AND pizza_table_1.pizza_name=pizza_table_2.pizza_name
ORDER BY pizza_table_1.pizza_name;