CREATE INDEX idx_person_order_multi 
ON person_order (person_id, menu_id, order_date);


SET enable_seqscan = OFF; -- not always needed here, so just in case

EXPLAIN ANALYZE 
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
-- Index Only Scan using idx_person_order_multi on person_order...


