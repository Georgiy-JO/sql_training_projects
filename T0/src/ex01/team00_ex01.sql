-- according to the example we need to work only with 5 steps (4 roads) road list
-- list travels of from "a" to "a" , that include each city only ones
CREATE VIEW a_to_a_five_city_list AS
WITH RECURSIVE rec_city_list AS (
    SELECT 
        'a'::VARCHAR AS cur_city,
        0::BIGINT AS road_cost, 
        ARRAY['a']::VARCHAR[] AS visited
    UNION ALL
    SELECT 
        abcd_tsp.point2 AS cur_city, 
        rec_city_list.road_cost + abcd_tsp.cost AS road_cost, 
        ARRAY_APPEND(rec_city_list.visited, abcd_tsp.point2) AS visited
    FROM rec_city_list
    JOIN abcd_tsp ON rec_city_list.cur_city = abcd_tsp.point1
    WHERE array_length(rec_city_list.visited, 1) < 4
        AND NOT abcd_tsp.point2 = ANY(rec_city_list.visited) 
)
-- SELECT * FROM rec_city_list;
SELECT road_cost+abcd_tsp.cost AS total_cost, ARRAY_APPEND(visited,'a'::VARCHAR ) AS tour
FROM rec_city_list
    JOIN abcd_tsp ON rec_city_list.cur_city = abcd_tsp.point1
                AND abcd_tsp.point2='a'
WHERE array_length(visited, 1) = 4
ORDER BY road_cost;

-- the result
SELECT total_cost, tour FROM a_to_a_five_city_list
WHERE total_cost<=(SELECT MIN(total_cost) AS min FROM a_to_a_five_city_list)
    OR total_cost>=(SELECT MAX(total_cost) AS min FROM a_to_a_five_city_list)
ORDER BY total_cost, tour;