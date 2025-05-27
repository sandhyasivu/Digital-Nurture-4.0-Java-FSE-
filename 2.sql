-- Exercise 2: Top Rated Events
-- Identify events with the highest average rating, considering only those that have received at least 10 feedback submissions

SELECT 
    e.event_id,
    e.title,
    e.description,
    e.city,
    COUNT(f.feedback_id) AS total_feedback,
    ROUND(AVG(f.rating), 2) AS average_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title, e.description, e.city
HAVING COUNT(f.feedback_id) >= 10
ORDER BY average_rating DESC, total_feedback DESC;

-- Sample Results:
-- event_id | title                | description                    | city      | total_feedback | average_rating
-- 2        | AI & ML Conference  | Conference on AI and ML...     | Chicago   | 12            | 4.75
-- 1        | Tech Innovators     | A meetup for tech enthusiasts. | New York  | 15            | 4.50
-- 3        | Frontend Bootcamp   | Hands-on training on frontend. | Los Angeles| 10           | 4.25