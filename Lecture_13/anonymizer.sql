UPDATE children SET first_name = CONCAT("Child ", child_id), last_name = CONCAT("Anonymous ", child_id);

UPDATE parents SET first_name = "Anonymous", last_name = CONCAT("Parent ", parent_id);

UPDATE institutions SET institution_name = CONCAT("Institution ", institution_id);

UPDATE parents SET tuition_fee = RAND() * 10000 + 10000;