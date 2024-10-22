SELECT person_order.order_date, (person_info.name || ' (age:' || person_info.age||')') AS person_information
FROM person_order 
NATURAL JOIN  (select id as person_id, name, age from person) as person_info
ORDER BY order_date, person_information;
