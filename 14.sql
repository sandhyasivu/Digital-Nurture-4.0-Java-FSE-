-- Exercise 14: Most Registered Events
-- List top 3 events based on the total number of user registrations

SELECT 
    e.event_id,
    e.title,
    e.city,
    e.start_date,
    COUNT(r.registration_id) AS total_registrations,
    COUNT(DISTINCT r.user_id) AS unique_registrants,
    ROUND((COUNT(r.registration_id) * 100.0 / e.capacity), 2) AS registration_percentage,
    GROUP_CONCAT(DISTINCT u.full_name) AS registered_users
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Users u ON r.user_id = u.user_id
GROUP BY e.event_id, e.title, e.city, e.start_date, e.capacity
ORDER BY total_registrations DESC
LIMIT 3;

-- Sample Results:
-- event_id | title                | city        | start_date           | total_registrations | unique_registrants | registration_percentage | registered_users
-- 2        | AI & ML Conference  | Chicago     | 2025-06-15 09:00:00 | 3                  | 3                  | 75.00                  | Alice J., Bob Smith, Charlie L.
-- 1        | Tech Innovators     | New York    | 2025-06-10 10:00:00 | 2                  | 2                  | 50.00                  | Alice J., Bob Smith
-- 3        | Frontend Bootcamp   | Los Angeles | 2025-07-01 10:00:00 | 2                  | 2                  | 40.00                  | Bob Smith, Charlie L. 