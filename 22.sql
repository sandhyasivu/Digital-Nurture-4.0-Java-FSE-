-- Exercise 22: Duplicate Registrations Check
-- Detect if a user has been registered more than once for the same event

SELECT 
    r.event_id,
    r.user_id,
    e.title AS event_title,
    u.full_name AS user_name,
    COUNT(r.registration_id) AS registration_count
FROM Registrations r
JOIN Events e ON r.event_id = e.event_id
JOIN Users u ON r.user_id = u.user_id
GROUP BY r.event_id, r.user_id, e.title, u.full_name
HAVING registration_count > 1
ORDER BY registration_count DESC, r.event_id, r.user_id;

-- Sample Results:
-- event_id | user_id | event_title        | user_name   | registration_count
-- 1        | 2       | Tech Innovators   | Bob Smith   | 2 