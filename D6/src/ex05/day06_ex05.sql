-- add comments to the table and it's columns
COMMENT ON TABLE person_discounts IS 'This table contains personal discounts of people included in the DB.';
COMMENT ON COLUMN person_discounts.id IS 'This column contains unique IDs for person-pizzeria pare.';
COMMENT ON COLUMN person_discounts.person_id IS 'This column keeps IDs of people.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'This column contains pizzerias IDs.';
COMMENT ON COLUMN person_discounts.discount IS 'This is the most informative column of the table. It keeps the information about personal discounts in percent form.';


-- to see the table info + comments
\d+ person_discounts

-- to see the table's comments
SELECT obj_description('person_discounts'::regclass);

-- to see each column comments
SELECT column_name, col_description('person_discounts'::regclass, ordinal_position)
FROM information_schema.columns
WHERE table_name = 'person_discounts';


