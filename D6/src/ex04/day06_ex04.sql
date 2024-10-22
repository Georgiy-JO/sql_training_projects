-- we already have some of constraints asked for in this tast! But we will add extra according to the task;

-- person_id column should not be NULL
ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);
-- pizzeria_id column should not be NULL
ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);
-- discount column should not be NULL
ALTER TABLE person_discounts ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL);
-- discount column should be 0 percent by default
ALTER TABLE person_discounts ALTER COLUMN discount SET DEFAULT 0;
-- discount column should be in a range values from 0 to 100
ALTER TABLE person_discounts ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);

-- to see table info
\d person_discounts