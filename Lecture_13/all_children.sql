SELECT c.last_name, c.first_name, i.institution_name, cl.class_name
FROM children c
         LEFT JOIN institutions i ON c.institution_id = i.institution_id
         LEFT JOIN classes cl ON c.class_id = cl.class_id
ORDER BY c.last_name, c.first_name