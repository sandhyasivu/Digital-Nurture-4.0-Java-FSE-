-- Exercise 10: Feedback Gap
-- Identify events that had registrations but received no feedback at all

SELECT 
    e.event_id,
    e.title,
    e.city,
    e.start_date,
    COUNT(r.registration_id) AS total_registrations,
    COUNT(f.feedback_id) AS feedback_count,
    ROUND((COUNT(f.feedback_id) * 100.0 / COUNT(r.registration_id)), 2) AS feedback_percentage
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id, e.title, e.city, e.start_date
ORDER BY total_registrations DESC;

-- Sample Results:
-- event_id | title                | city        | start_date           | total_registrations | feedback_count | feedback_percentage
-- 2        | AI & ML Conference  | Chicago     | 2025-06-15 09:00:00 | 3                  | 0              | 0.00
-- 3        | Frontend Bootcamp   | Los Angeles | 2025-07-01 10:00:00 | 2                  | 0              | 0.00 