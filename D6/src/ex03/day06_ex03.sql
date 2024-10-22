-- creating index
CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique 
ON person_discounts (person_id, pizzeria_id);

-- checking speed
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT person_id, pizzeria_id, discount,name,rating FROM person_discounts
JOIN pizzeria ON pizzeria.id=person_discounts.pizzeria_id
WHERE person_id>5 AND pizzeria.name ILIKE 'papa%';
-- Index Scan using idx_person_discounts_unique on person_discounts...
--  Planning Time: 0.291 ms
--  Execution Time: 0.056 ms
