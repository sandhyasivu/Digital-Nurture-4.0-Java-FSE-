-- Exercise 7: Low Feedback Alerts
-- List all users who gave feedback with a rating less than 3, along with their comments and associated event names

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    e.title AS event_title,
    f.rating,
    f.comments,
    f.feedback_date
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3
ORDER BY f.rating ASC, f.feedback_date DESC;

-- Sample Results:
-- user_id | full_name  | email            | event_title        | rating | comments        | feedback_date
-- 2       | Bob Smith  | bob@example.com  | Tech Innovators    | 3      | Could be better.| 2025-06-11
-- 1       | Alice J.   | alice@example.com| Frontend Bootcamp  | 2      | Poor content    | 2025-07-04
-- 3       | Charlie L. | charlie@example.com| AI Conference    | 2      | Not organized   | 2025-05-17 