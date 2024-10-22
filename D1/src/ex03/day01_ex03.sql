SELECT order_date AS action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date AS action_date,  person_id
FROM person_visits
ORDER BY action_date ASC, person_id DESC;


--other way
-- SELECT person_order.order_date AS action_date, person_order.person_id AS person_id
-- FROM person_order, person_visits
-- WHERE person_order.order_date=person_visits.visit_date AND person_order.person_id=person_visits.person_id
-- UNION
-- SELECT person_visits.visit_date AS action_date, person_visits.person_id AS person_id
-- FROM person_order, person_visits
-- WHERE person_order.order_date=person_visits.visit_date AND person_order.person_id=person_visits.person_id
-- ORDER BY action_date ASC, person_id DESC;
