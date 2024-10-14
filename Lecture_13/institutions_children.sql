SELECT i.institution_name, i.address, COUNT(c.child_id) AS children_count
FROM institutions i
LEFT JOIN children c ON c.institution_id = i.institution_id
GROUP BY 1