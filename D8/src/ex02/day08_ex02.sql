-- ISOLATION LEVEL: REPEATABLE READ - ensures that once a transaction reads data, 
-- it will always see the same data throughout the entire transaction, 
-- even if other transactions modify or commit changes to the data during that time.

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
START TRANSACTION;    -- for [session #1]
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;    -- for [session #1]
SHOW TRANSACTION ISOLATION LEVEL;    -- for [session #1]

START TRANSACTION;    -- for [session #2]
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;    -- for [session #2]
SHOW TRANSACTION ISOLATION LEVEL;    -- for [session #2]


-- step_2
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1]

select * from pizzeria where name= 'Pizza Hut';         -- for [session #2]


-- step_3
UPDATE pizzeria SET rating=4 WHERE name='Pizza Hut';    -- for [session #1]

UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';  -- for [session #2]
-- won't be finished before commiting the [session #1] transaction; 
-- after  [session #1] commit will return an error and won't allow to UPDATE until the commit of [session #2]

-- screenshots before commit: 
--              [session #1]-sh_2_0.png; 
--              [session #2]-sh_2_1.png.


-- step_4
COMMIT;         -- for [session #1]

COMMIT;         -- for [session #2]     -- result in "ROLLBACK"


-- step_5
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1]

select * from pizzeria where name= 'Pizza Hut';         -- for [session #2]

-- final screenshots: 
--              [session #1]-sh_2_2.png; 
--              [session #2]-sh_2_3.png.