SELECT pr.address AS address,  pz.name AS name, COUNT(*) AS count_of_orders
FROM person_visits pv
    JOIN person pr ON pv.person_id=pr.id
    JOIN pizzeria pz ON pv.pizzeria_id=pz.id
    JOIN person_order po ON pv.person_id=po.person_id
    JOIN menu m ON po.menu_id=m.id
                AND pz.id=m.pizzeria_id
GROUP BY pz.name, pr.address
ORDER BY address, name;