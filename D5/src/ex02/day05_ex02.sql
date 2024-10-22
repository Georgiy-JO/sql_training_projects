-- creating index
CREATE INDEX idx_person_name
ON person (UPPER(name));

SET enable_seqscan = OFF;
EXPLAIN ANALYZE 
SELECT * FROM person
WHERE UPPER(NAME)='IRINA';
--  Planning Time: 0.054 ms
--  Execution Time: 0.055 ms

SET enable_seqscan = ON;
EXPLAIN ANALYZE 
SELECT * FROM person
WHERE UPPER(NAME)='IRINA';
--  Planning Time: 0.137 ms
--  Execution Time: 0.077 ms

