-- the result -- according to the example we need to work only with 5 steps (4 roads) road list
SELECT road_cost AS total_cost, the_way AS tour FROM five_r_list
WHERE road_cost<=(SELECT MIN(road_cost) AS min FROM five_r_list)
    OR road_cost>=(SELECT MAX(road_cost) AS min FROM five_r_list)
ORDER BY total_cost, tour;