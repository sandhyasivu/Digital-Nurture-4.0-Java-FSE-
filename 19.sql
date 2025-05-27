-- Exercise 19: Completed Events with Feedback Summary
-- For completed events, show total registrations and average feedback rating

SELECT 
    e.event_id,
    e.title,
    e.city,
    e.start_date,
    e.end_date,
    COUNT(DISTINCT r.registration_id) AS total_registrations,
    COUNT(DISTINCT f.feedback_id) AS total_feedback,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    MIN(f.rating) AS min_rating,
    MAX(f.rating) AS max_rating,
    ROUND((COUNT(DISTINCT f.feedback_id) * 100.0 / COUNT(DISTINCT r.registration_id)), 2) AS feedback_percentage
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title, e.city, e.start_date, e.end_date
ORDER BY e.end_date DESC;

-- Sample Results:
-- event_id | title                | city        | start_date           | end_date             | total_registrations | total_feedback | avg_rating | min_rating | max_rating | feedback_percentage
-- 1        | Tech Innovators     | New York    | 2025-06-10 10:00:00 | 2025-06-10 16:00:00 | 10                 | 8              | 4.50       | 3          | 5          | 80.00 