CREATE VIEW v_symmetric_union AS (
    WITH jan_2 AS(
    SELECT * FROM person_visits
    WHERE visit_date='2022-01-02'),
    jan_6 AS(
    SELECT * FROM person_visits
    WHERE visit_date='2022-01-06')

    (SELECT person_id FROM jan_2 EXCEPT SELECT person_id FROM jan_6)
    UNION
    (SELECT  person_id FROM jan_6 EXCEPT SELECT person_id FROM jan_2)
    ORDER BY person_id);