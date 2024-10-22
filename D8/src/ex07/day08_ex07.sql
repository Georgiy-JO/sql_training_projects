-- A DEADLOCK is a situation in a database where two or more transactions are unable to proceed 
-- because they are each waiting for the other to release a resource (such as a lock) that they need in order to continue,
-- effectively causing them to become stuck indefinitely unless the deadlock is detected and resolved.
-- In most database systems (inc. PostgreSQL), deadlock detection and resolving is automatic, 
-- it  chooses one of the transactions to abort. 

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
-- [session #1]
START TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;
-- [session #2]
START TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;


-- step_2
-- [session #1]
UPDATE pizzeria SET rating =3 WHERE id=10;


-- step_3
-- [session #2]
UPDATE pizzeria SET rating =3 WHERE id=11;


-- step_4
-- [session #1]
UPDATE pizzeria SET rating =3.9 WHERE id=11;


-- step_5
-- [session #2]
UPDATE pizzeria SET rating =3.9 WHERE id=10;


-- step_6
-- [session #1]
COMMIT;
-- [session #2]
COMMIT;

-- step_7
-- [session #1]
SELECT * FROM pizzeria WHERE id=10 OR id=11;
-- [session #2]
SELECT * FROM pizzeria WHERE id=10 OR id=11;

-- final screenshots: 
--              [session #1]-sh_7_0.png; 
--              [session #2]-sh_7_1.png.

-- RESULT: psql killed the [session #2] TRANSACTION so only UPDATEs from TRANSACTION [session #1] stayed