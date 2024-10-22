CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order (person_id,menu_id)
WHERE order_date ='2022-01-01';



SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT DISTINCT person_id,menu_id
FROM (SELECT * FROM person_order WHERE order_date ='2022-01-01') AS tmp
WHERE menu_id BETWEEN 1 AND 5;
-- Index Only Scan using idx_person_order_order_date on person_order ...
--  Planning Time: 0.115 ms
--  Execution Time: 0.104 ms


SET enable_seqscan = ON;
EXPLAIN ANALYZE
SELECT DISTINCT person_id,menu_id
FROM (SELECT * FROM person_order WHERE order_date ='2022-01-01') AS tmp
WHERE menu_id BETWEEN 1 AND 5;
--  Planning Time: 0.307 ms
--  Execution Time: 0.113 ms