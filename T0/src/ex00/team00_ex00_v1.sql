-- Creating table
CREATE TABLE abcd_tsp (
    -- id BIGSERIAL NOT NULL PRIMARY KEY,
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost BIGINT NOT NULL
);

-- Inputting data
INSERT INTO abcd_tsp (
    point1,
    point2,
    cost
)
VALUES ('a','b',10),
('a','c',15),
('a','d',20),
('b','c',35),
('b','d',25),
('c','d',30);

INSERT INTO abcd_tsp (
    point1,
    point2,
    cost
)
SELECT abcd_tsp_1.point2, abcd_tsp_1.point1, abcd_tsp_1.cost FROM abcd_tsp AS abcd_tsp_1;







-- Getting all tours with minimum travel cost

CREATE VIEW city_list AS 
SELECT point1 AS city FROM abcd_tsp
GROUP BY point1
ORDER BY point1;

-- five steps road view
CREATE VIEW five_r_list AS
WITH full_l_5 AS (
SELECT (r1.cost+r2.cost+r3.cost+r4.cost) AS road_cost, 
    ('{'||r1.point1||','||r2.point1||','||r3.point1||','||r4.point1||','||r4.point2||'}') AS the_way
    -- (r1.point1||r1.point2||r2.point1||r2.point2||r3.point1||r3.point2||r4.point1||r4.point2) AS the_way
FROM abcd_tsp AS r1,
    abcd_tsp AS r2,
    abcd_tsp AS r3,
    abcd_tsp AS r4
WHERE r1.point1='a'
    AND r1.point2=r2.point1
    AND r2.point2=r3.point1
    AND r3.point2=r4.point1
    AND r4.point2=r1.point1
ORDER BY the_way)
SELECT road_cost, the_way FROM full_l_5
JOIN city_list ON full_l_5.the_way LIKE '%'||city_list.city ||'%'
GROUP BY road_cost, the_way HAVING COUNT(*)>=4
ORDER BY the_way;


-- six steps road view - there is a possibility that going back is more profitable 
CREATE VIEW six_r_list AS
WITH full_l_6 AS (
SELECT (r1.cost+r2.cost+r3.cost+r4.cost+r5.cost) AS road_cost, 
    ('{'||r1.point1||','||r2.point1||','||r3.point1||','||r4.point1||','||r5.point1||','||r5.point2||'}') AS the_way
FROM abcd_tsp AS r1,
    abcd_tsp AS r2,
    abcd_tsp AS r3,
    abcd_tsp AS r4,
    abcd_tsp AS r5
WHERE r1.point1='a'
    AND r1.point2=r2.point1
    AND r2.point2=r3.point1
    AND r3.point2=r4.point1
    AND r4.point2=r5.point1
    AND r5.point2=r1.point1
ORDER BY the_way)
SELECT road_cost, the_way FROM full_l_6
JOIN city_list ON the_way LIKE '%'||city_list.city||'%'
GROUP BY road_cost, the_way HAVING COUNT(*)>=4
ORDER BY the_way;


-- seven steps road view -- there is a possibility that going back is more profitable 
CREATE VIEW seven_r_list AS
WITH full_l_7 AS (
SELECT (r1.cost+r2.cost+r3.cost+r4.cost+r5.cost+r6.cost) AS road_cost, 
    ('{'||r1.point1||','||r2.point1||','||r3.point1||','||r4.point1||','||r5.point1||','||r6.point1||','||r6.point2||'}') AS the_way
FROM abcd_tsp AS r1,
    abcd_tsp AS r2,
    abcd_tsp AS r3,
    abcd_tsp AS r4,
    abcd_tsp AS r5,
    abcd_tsp AS r6
WHERE r1.point1='a'
    AND r1.point2=r2.point1
    AND r2.point2=r3.point1
    AND r3.point2=r4.point1
    AND r4.point2=r5.point1
    AND r5.point2=r6.point1
    AND r6.point2=r1.point1
ORDER BY the_way)
SELECT road_cost, the_way FROM full_l_7
JOIN city_list ON the_way LIKE '%'||city_list.city||'%'
GROUP BY road_cost, the_way HAVING COUNT(*)>=4
ORDER BY the_way;

-- the result
WITH full_road_list AS(
SELECT road_cost, the_way FROM five_r_list
UNION ALL 
SELECT road_cost, the_way FROM six_r_list
UNION ALL 
SELECT road_cost, the_way FROM seven_r_list
ORDER BY road_cost
)
SELECT road_cost AS total_cost, the_way AS tour FROM full_road_list
WHERE road_cost<=(SELECT MIN(road_cost) AS min FROM full_road_list)
ORDER BY total_cost, tour;