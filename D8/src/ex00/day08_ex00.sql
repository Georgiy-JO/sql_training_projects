-- Update of rating for "Pizza Hut" to 5 points in a transaction mode in [session #1]
START TRANSACTION ;
UPDATE pizzeria SET rating=5 WHERE name='Pizza Hut';
-- check the changes
select * from pizzeria where name= 'Pizza Hut';
-- [session #1] result: sh_0_0.png

-- screenshot of [session #2]: sh_0_1.png

-- Publish your changes for all parallel sessions in [session #1]
COMMIT;

-- screenshot of [session #2] after the commit: sh_0_2.png
