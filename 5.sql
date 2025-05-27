-- Exercise 5: Most Active Cities
-- List the top 5 cities with the highest number of distinct user registrations

SELECT 
    e.city,
    COUNT(DISTINCT r.user_id) AS unique_registrations,
    COUNT(DISTINCT e.event_id) AS total_events,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / 
        (SELECT COUNT(DISTINCT user_id) FROM Users), 2) AS registration_percentage
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.city
ORDER BY unique_registrations DESC
LIMIT 5;

-- Sample Results:
-- city        | unique_registrations | total_events | registration_percentage
-- New York    | 2                   | 1            | 40.00
-- Los Angeles | 2                   | 1            | 40.00
-- Chicago     | 1                   | 1            | 20.00 