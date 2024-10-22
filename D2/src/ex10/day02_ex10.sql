SELECT DISTINCT 
    LEAST(p_l_1.name,p_l_2.name)  AS person_name1, 
    GREATEST (p_l_1.name,p_l_2.name)  AS person_name2, 
    p_l_1.address AS common_address
FROM 
    person AS p_l_1,
    person AS p_l_2 
WHERE 
    p_l_1.name<>p_l_2.name
    AND p_l_1.address=p_l_2.address
ORDER BY person_name1, person_name2, common_address;


