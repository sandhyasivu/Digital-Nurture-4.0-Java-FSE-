-- Exercise 21: Top Feedback Providers
-- List top 5 users who have submitted the most feedback entries

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    COUNT(f.feedback_id) AS feedback_count,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    GROUP_CONCAT(DISTINCT e.title) AS events_reviewed
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
JOIN Events e ON f.event_id = e.event_id
GROUP BY u.user_id, u.full_name, u.email
ORDER BY feedback_count DESC, avg_rating DESC
LIMIT 5;

-- Sample Results:
-- user_id | full_name   | email             | feedback_count | avg_rating | events_reviewed
-- 1       | Alice J.    | alice@example.com | 5             | 4.60       | Tech Innovators, AI Conference, Frontend Bootcamp
-- 2       | Bob Smith   | bob@example.com   | 4             | 4.25       | Tech Innovators, Frontend Bootcamp
-- 3       | Charlie L.  | charlie@example.com| 3            | 3.67       | AI Conference, Frontend Bootcamp 