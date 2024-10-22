-- creating a sequence
CREATE SEQUENCE seq_person_discounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- To avoid conflicts with existing id values, we must update the sequence to start after the current maximum id in the table.
SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));
--or
-- SELECT setval('seq_person_discounts', (SELECT (SELECT COUNT(*) FROM person_discounts) FROM person_discounts));

-- making so id column will take value and be autoincreased with this sequence
ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');


\d person_discounts
--                                 Table "public.person_discounts"
--    Column    |     Type     | Collation | Nullable |                  Default                  
-- -------------+--------------+-----------+----------+-------------------------------------------
--  id          | bigint       |           | not null | nextval('seq_person_discounts'::regclass)
--  person_id   | bigint       |           | not null | 
--  pizzeria_id | bigint       |           | not null | 
--  discount    | numeric(5,2) |           |          | 0
