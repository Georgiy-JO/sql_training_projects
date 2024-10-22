-- ISOLATION LEVEL: READ COMMITTED - ensures that a transaction can only see data that has been committed by other transactions. 
-- This means that any changes made by another transaction that are not yet committed are invisible to a transaction.

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
-- [session #1]
START TRANSACTION ISOLATION LEVEL READ COMMITTED; 
SHOW TRANSACTION ISOLATION LEVEL;
-- [session #2]
START TRANSACTION ISOLATION LEVEL READ COMMITTED; 
SHOW TRANSACTION ISOLATION LEVEL;


-- step_2
-- [session #1]
select SUM(rating) from pizzeria;


-- step_3
-- [session #2]
INSERT INTO pizzeria (id, name,rating) 
VALUES (10, 'Kazan Pizza', 5);
COMMIT;        

-- step_4
-- [session #1]
select SUM(rating) from pizzeria;
COMMIT;


-- step_5
-- [session #1]
select SUM(rating) from pizzeria;
-- [session #2]
select SUM(rating) from pizzeria;     

-- final screenshots: 
--              [session #1]-sh_5_0.png; 
--              [session #2]-sh_5_1.png.