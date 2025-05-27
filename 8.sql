-- Exercise 8: Sessions per Upcoming Event
-- Display all upcoming events with the count of sessions scheduled for them

SELECT 
    e.event_id,
    e.title,
    e.description,
    e.city,
    e.start_date,
    e.end_date,
    COUNT(s.session_id) AS total_sessions,
    MIN(s.start_time) AS first_session,
    MAX(s.end_time) AS last_session
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
    AND e.start_date > CURRENT_DATE()
GROUP BY e.event_id, e.title, e.description, e.city, e.start_date, e.end_date
ORDER BY e.start_date ASC;

-- Sample Results:
-- event_id | title                | description                    | city        | start_date           | end_date             | total_sessions | first_session      | last_session
-- 1        | Tech Innovators     | A meetup for tech enthusiasts. | New York    | 2025-06-10 10:00:00 | 2025-06-10 16:00:00 | 2             | 2025-06-10 10:00:00| 2025-06-10 12:30:00
-- 3        | Frontend Bootcamp   | Hands-on training on frontend. | Los Angeles | 2025-07-01 10:00:00 | 2025-07-03 16:00:00 | 1             | 2025-07-01 10:00:00| 2025-07-01 12:00:00 