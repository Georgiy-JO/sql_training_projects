SELECT 
    address, 
    ROUND((MAX(age::numeric)-(MIN(age::numeric)/MAX(age::numeric))),2) AS formula, 
    ROUND(AVG(age),2) AS average, 
    ((MAX(age)-(MIN(age)/MAX(age)))>AVG(age)) AS comparison
FROM person
GROUP BY address
ORDER BY address;


-- OR
-- SELECT 
--     address, 
--     ROUND((MAX(age::numeric)-(MIN(age::numeric)/MAX(age::numeric))),2) AS formula, 
--     ROUND(AVG(age),2) AS average, 
--     (CASE
--         WHEN ((MAX(age)-(MIN(age)/MAX(age)))>AVG(age))
--             THEN TRUE
--             ELSE FALSE
--     END) AS comparison
-- FROM person
-- GROUP BY address
-- ORDER BY address;