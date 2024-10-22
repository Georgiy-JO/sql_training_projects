-- ISOLATION LEVEL: READ COMMITTED - ensures that a transaction can only see data that has been committed by other transactions. 
-- This means that any changes made by another transaction that are not yet committed are invisible to a transaction.

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
START TRANSACTION ISOLATION LEVEL READ COMMITTED;    -- for [session #1]
SHOW TRANSACTION ISOLATION LEVEL;    -- for [session #1]

START TRANSACTION ISOLATION LEVEL READ COMMITTED;    -- for [session #2]
SHOW TRANSACTION ISOLATION LEVEL;    -- for [session #2]


-- step_2
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1]


-- step_3
UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';  -- for [session #2]
COMMIT;         -- for [session #2] 

-- step_4
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1]
COMMIT;         -- for [session #1]


-- step_5
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1]

select * from pizzeria where name= 'Pizza Hut';         -- for [session #2]

-- final screenshots: 
--              [session #1]-sh_3_0.png; 
--              [session #2]-sh_3_1.png.