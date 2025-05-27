-- Exercise 12: Event with Maximum Sessions
-- List the event(s) with the highest number of sessions

WITH SessionCounts AS (
    SELECT 
        e.event_id,
        e.title,
        e.city,
        e.start_date,
        COUNT(s.session_id) AS session_count,
        GROUP_CONCAT(s.title) AS session_titles
    FROM Events e
    LEFT JOIN Sessions s ON e.event_id = s.event_id
    GROUP BY e.event_id, e.title, e.city, e.start_date
)
SELECT *
FROM SessionCounts
WHERE session_count = (
    SELECT MAX(session_count)
    FROM SessionCounts
)
ORDER BY start_date ASC;

-- Sample Results:
-- event_id | title                | city        | start_date           | session_count | session_titles
-- 1        | Tech Innovators     | New York    | 2025-06-10 10:00:00 | 2             | Introduction to AI, Machine Learning Basics
-- 3        | Frontend Bootcamp   | Los Angeles | 2025-07-01 10:00:00 | 2             | HTML/CSS Fundamentals, JavaScript Basics 