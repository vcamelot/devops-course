SELECT p.last_name, p.first_name, c.last_name, c.first_name, p.tuition_fee
FROM parents p
LEFT JOIN children c on p.child_id = c.child_id
ORDER BY p.last_name, p.first_name