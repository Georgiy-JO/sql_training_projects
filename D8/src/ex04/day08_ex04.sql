-- ISOLATION LEVEL: The SERIALIZABLE isolation level is the highest level of transaction isolation in PostgreSQL. 
-- It ensures complete isolation between transactions, meaning that transactions are executed as if they were run serially, 
-- one after the other, even if they are executed concurrently. This prevents all forms of concurrency anomalies, 
-- such as dirty reads, non-repeatable reads, and phantom reads.

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
-- [session #1]
START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
-- [session #2]
START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;


-- step_2
-- [session #1]
select * from pizzeria where name= 'Pizza Hut';


-- step_3
-- [session #2]
UPDATE pizzeria SET rating=3.0 WHERE name='Pizza Hut';
COMMIT;        

-- step_4
-- [session #1]
select * from pizzeria where name= 'Pizza Hut';
COMMIT;


-- step_5
-- [session #1]
select * from pizzeria where name= 'Pizza Hut';
-- [session #2]
select * from pizzeria where name= 'Pizza Hut';       

-- final screenshots: 
--              [session #1]-sh_4_0.png; 
--              [session #2]-sh_4_1.png.