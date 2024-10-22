SELECT
    (SELECT person.name
     FROM person
     WHERE person.id = person_order.person_id) AS NAME,
    
    (SELECT CASE 
               WHEN person.name = 'Denis' THEN 'true'
               ELSE 'false'
            END
     FROM person
     WHERE person.id = person_order.person_id) AS check_name
FROM person_order
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) 
  AND order_date = DATE '2022-01-07';
