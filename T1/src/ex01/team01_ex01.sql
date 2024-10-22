-- pre-work
INSERT INTO currency
	VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
	VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

-- the task
SELECT COALESCE(u.name, 'not defined') AS name, COALESCE(u.lastname, 'not defined') AS lastname,
        c.name AS currency_name, (b.money * c.rate_to_usd)::real AS currency_in_usd
FROM balance AS b
        LEFT JOIN "user" AS u ON b.user_id = u.id
    JOIN currency AS c ON (b.currency_id = c.id AND c.updated = COALESCE(
                (SELECT MAX(c1.updated) FROM currency AS c1
                        WHERE c.id = c1.id AND b.updated >= c1.updated
                        GROUP BY c1.id), (SELECT MIN(c2.updated) FROM currency AS c2
                                WHERE c.id = c2.id AND b.updated < c2.updated
                                        GROUP BY c2.id)))
ORDER BY name DESC, lastname, currency_name;
