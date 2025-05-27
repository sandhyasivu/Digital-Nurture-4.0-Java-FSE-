-- Exercise 24: Average Session Duration per Event
-- Compute the average duration (in minutes) of sessions in each event

SELECT 
    e.event_id,
    e.title AS event_title,
    e.city,
    COUNT(s.session_id) AS total_sessions,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)), 2) AS avg_session_duration_min
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id, e.title, e.city
ORDER BY avg_session_duration_min DESC;

-- Sample Results:
-- event_id | event_title        | city        | total_sessions | avg_session_duration_min
-- 1        | Tech Innovators   | New York    | 2              | 90.00 