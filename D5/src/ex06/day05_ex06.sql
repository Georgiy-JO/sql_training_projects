-- beafore adding index
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
-- Seq Scan on pizzeria pz...
--  Planning Time: 0.408 ms
--  Execution Time: 0.325 ms


-- creating index
CREATE INDEX idx_1
ON pizzeria (id,rating);


-- after adding index
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
-- Index Only Scan using idx_1 on pizzeria pz ...
--   Planning Time: 0.278 ms
--   Execution Time: 0.143 ms


-- deleting index 
DROP INDEX IF EXISTS idx_1 ;