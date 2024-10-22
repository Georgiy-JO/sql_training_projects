SELECT missing_date::DATE
FROM 
    generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
LEFT JOIN 
    ( SELECT DISTINCT visit_date FROM person_visits
    WHERE  (person_visits.person_id=1 OR person_visits.person_id=2)) AS per_v
ON missing_date=per_v.visit_date
WHERE per_v.visit_date IS NULL
ORDER BY missing_date;