DROP VIEW v_generated_dates, v_price_with_discount, v_persons_female, v_persons_male, v_symmetric_union;
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
DROP TABLE IF EXISTS person_visits, person_order, person, menu,  pizzeria CASCADE;


--or just drop the whole DB
\c postgres
DROP DATABASE s21_db;