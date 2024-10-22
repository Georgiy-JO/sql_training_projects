-- ISOLATION LEVEL: REPEATABLE READ - nsures that once a transaction reads data, 
-- it will always see the same data throughout the entire transaction, 
-- even if other transactions modify or commit changes to the data during that time.

-- Following command must be executed one after another from top to bottom and according to comments:

-- step_1
-- [session #1]
START TRANSACTION ISOLATION LEVEL REPEATABLE READ ; 
SHOW TRANSACTION ISOLATION LEVEL;
-- [session #2]
START TRANSACTION ISOLATION LEVEL REPEATABLE READ ; 
SHOW TRANSACTION ISOLATION LEVEL;


-- step_2
-- [session #1]
select SUM(rating) from pizzeria;


-- step_3
-- [session #2]
INSERT INTO pizzeria (id, name,rating) 
VALUES (11, 'Kazan Pizza 2', 4);
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
--              [session #1]-sh_6_0.png; 
--              [session #2]-sh_6_1.png.