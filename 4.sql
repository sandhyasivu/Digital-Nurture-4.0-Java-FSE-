-- Exercise 4: Peak Session Hours
-- Count how many sessions are scheduled between 10 AM to 12 PM for each event

SELECT 
    e.event_id,
    e.title,
    e.city,
    COUNT(s.session_id) AS morning_sessions
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id, e.title, e.city
ORDER BY morning_sessions DESC;

-- Sample Results:
-- event_id | title                | city        | morning_sessions
-- 1        | Tech Innovators     | New York    | 2
-- 3        | Frontend Bootcamp   | Los Angeles | 1
-- 2        | AI & ML Conference  | Chicago     | 0 