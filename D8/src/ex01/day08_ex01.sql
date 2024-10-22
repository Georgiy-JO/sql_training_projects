-- checkint the isolation level 
SHOW TRANSACTION ISOLATION LEVEL;
-- [session #1] - sh_1_0.png; [session #2] - sh_1_1.sh

-- checking the value and updating it for [session #1] and [session #2]. 
--      Following command must be executed one after another from top to bottom and according to comments

START TRANSACTION;                                      -- for [session #1] and after that for [session #2]
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1] and after that for [session #2]
UPDATE pizzeria SET rating=4 WHERE name='Pizza Hut';    -- for [session #1]
UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';  -- for [session #2]

-- screenshots before commit: 
--              [session #1]-sh_1_2.png; 
--              [session #2]-sh_1_3.png.
-- NOTE:    [session #2] UPDATE will not work until the transaction for 1 session is completed via COMMIT.
COMMIT;                                                 -- for [session #1] 

-- after the transaction for [session #1] was commited the [session #2] UPDATE lost the 'lock' and was finished
-- screenshots before commit of [session #1]: 
--              [session #2]-sh_1_4.png.
COMMIT;                                                 -- for [session #2]
select * from pizzeria where name= 'Pizza Hut';         -- for [session #1] and after that for [session #2]

-- final screenshots: 
--              [session #1]-sh_1_5.png; 
--              [session #2]-sh_1_6.png.