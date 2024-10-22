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
VALUES 
    ('a','b',10),
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
SELECT point2, point1, cost FROM abcd_tsp;





-- Getting all tours with minimum travel cost
-- full list of travels from "a" to "a", that include all cities
CREATE VIEW a_to_a_city_list AS
WITH RECURSIVE rec_city_list AS (
    SELECT 
        'a'::VARCHAR AS cur_city,
        0::BIGINT AS road_cost, 
        ARRAY['a']::VARCHAR[] AS visited,
        ARRAY['a']::VARCHAR[] AS unique_visit
    UNION ALL
    SELECT 
        abcd_tsp.point2 AS cur_city, 
        rec_city_list.road_cost + abcd_tsp.cost AS road_cost, 
        ARRAY_APPEND(rec_city_list.visited, abcd_tsp.point2) AS visited,
        CASE 
            WHEN abcd_tsp.point2=ANY(rec_city_list.unique_visit)
                THEN rec_city_list.unique_visit
                ELSE ARRAY_APPEND(rec_city_list.unique_visit, abcd_tsp.point2)
        END AS unique_visit
    FROM rec_city_list
    JOIN abcd_tsp ON rec_city_list.cur_city = abcd_tsp.point1
    WHERE array_length(unique_visit, 1) < 4
        AND array_length(visited, 1) < 6
)
SELECT road_cost+abcd_tsp.cost AS total_cost, ARRAY_APPEND(visited,'a'::VARCHAR ) AS tour
FROM rec_city_list
    JOIN abcd_tsp ON rec_city_list.cur_city = abcd_tsp.point1
                AND abcd_tsp.point2='a'
WHERE array_length(unique_visit, 1) = 4
ORDER BY road_cost;

-- the result
SELECT total_cost, tour FROM a_to_a_city_list
WHERE total_cost<=(SELECT MIN(total_cost) AS min FROM a_to_a_city_list)
ORDER BY total_cost, tour;