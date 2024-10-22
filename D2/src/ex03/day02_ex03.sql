WITH tmp_table AS (
    SELECT DISTINCT visit_date FROM person_visits
    WHERE  (person_visits.person_id=1 OR person_visits.person_id=2)
),
calendar AS (
    SELECT * FROM  generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date 
)
SELECT missing_date::DATE 
FROM calendar
LEFT JOIN tmp_table
ON missing_date=tmp_table.visit_date
WHERE tmp_table.visit_date IS NULL
ORDER BY missing_date;

