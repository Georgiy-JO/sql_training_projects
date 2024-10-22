SELECT person_id from person_order
WHERE order_date = DATE '2022-01-07'
EXCEPT ALL
SELECT person_id from person_visits
WHERE visit_date = DATE '2022-01-07';
