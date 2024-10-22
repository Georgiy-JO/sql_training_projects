
-- returns pizzas and the corresponding pizzeria names
SELECT pizza_name, name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id;


-- return analizes of the command execution
EXPLAIN ANALYZE 
SELECT pizza_name, name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id;
-- OUTPUT (NO Index Scan):
--  Planning Time: 0.286 ms
--  Execution Time: 0.137 ms


-- prevents from using sequential (row after row) scans
SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT pizza_name, name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id;
-- OUTPUT(Index Scan):
--  Planning Time: 0.110 ms
--  Execution Time: 0.058 ms

