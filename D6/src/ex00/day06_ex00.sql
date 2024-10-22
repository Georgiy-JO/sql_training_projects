-- create a new table
CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount numeric(5,2) DEFAULT 0,
    CONSTRAINT fk_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id),
    UNIQUE(person_id, pizzeria_id),
    CHECK (discount<=100 AND discount>=0)
);