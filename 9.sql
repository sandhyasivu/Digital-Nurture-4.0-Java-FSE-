-- Exercise 9: Organizer Event Summary
-- For each event organizer, show the number of events created and their current status

SELECT 
    o.organizer_id,
    o.name AS organizer_name,
    o.email,
    COUNT(e.event_id) AS total_events,
    SUM(CASE WHEN e.status = 'upcoming' THEN 1 ELSE 0 END) AS upcoming_events,
    SUM(CASE WHEN e.status = 'completed' THEN 1 ELSE 0 END) AS completed_events,
    SUM(CASE WHEN e.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_events,
    ROUND(AVG(f.rating), 2) AS avg_event_rating
FROM Organizers o
LEFT JOIN Events e ON o.organizer_id = e.organizer_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
GROUP BY o.organizer_id, o.name, o.email
ORDER BY total_events DESC;

-- Sample Results:
-- organizer_id | organizer_name | email            | total_events | upcoming_events | completed_events | cancelled_events | avg_event_rating
-- 1           | John Doe      | john@example.com | 2           | 1              | 1               | 0               | 4.50
-- 2           | Jane Smith    | jane@example.com | 1           | 1              | 0               | 0               | 3.00 