-- Exercise 13: Average Rating per City
-- Calculate the average feedback rating of events conducted in each city

SELECT 
    e.city,
    COUNT(DISTINCT e.event_id) AS total_events,
    COUNT(f.feedback_id) AS total_feedback,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    MIN(f.rating) AS min_rating,
    MAX(f.rating) AS max_rating,
    GROUP_CONCAT(DISTINCT e.title) AS event_titles
FROM Events e
LEFT JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.city
HAVING total_feedback > 0
ORDER BY avg_rating DESC;

-- Sample Results:
-- city        | total_events | total_feedback | avg_rating | min_rating | max_rating | event_titles
-- New York    | 1           | 2              | 4.50       | 4          | 5          | Tech Innovators
-- Los Angeles | 1           | 1              | 3.00       | 3          | 3          | Frontend Bootcamp 