-- Exercise 18: Resource Availability Check
-- List all events that do not have any resources uploaded

SELECT 
    e.event_id,
    e.title,
    e.city,
    e.start_date,
    e.end_date,
    e.status
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL
ORDER BY e.start_date DESC;

-- Sample Results:
-- event_id | title                | city        | start_date           | end_date             | status
-- 2        | AI & ML Conference  | Chicago     | 2025-06-15 09:00:00 | 2025-06-15 17:00:00 | upcoming
-- 3        | Frontend Bootcamp   | Los Angeles | 2025-07-01 10:00:00 | 2025-07-03 16:00:00 | upcoming 