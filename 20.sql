-- Exercise 20: User Engagement Index
-- For each user, calculate how many events they attended and how many feedbacks they submitted

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    COUNT(DISTINCT r.event_id) AS events_attended,
    COUNT(DISTINCT f.feedback_id) AS feedbacks_submitted,
    ROUND((COUNT(DISTINCT f.feedback_id) * 100.0 / COUNT(DISTINCT r.event_id)), 2) AS feedback_rate,
    GROUP_CONCAT(DISTINCT e.title) AS attended_events
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Events e ON r.event_id = e.event_id
LEFT JOIN Feedback f ON u.user_id = f.user_id AND e.event_id = f.event_id
GROUP BY u.user_id, u.full_name, u.email
HAVING events_attended > 0
ORDER BY events_attended DESC, feedbacks_submitted DESC;

-- Sample Results:
-- user_id | full_name   | email             | events_attended | feedbacks_submitted | feedback_rate | attended_events
-- 1       | Alice J.    | alice@example.com | 3              | 2                  | 66.67         | Tech Innovators, AI Conference, Frontend Bootcamp
-- 2       | Bob Smith   | bob@example.com   | 2              | 1                  | 50.00         | Tech Innovators, Frontend Bootcamp 