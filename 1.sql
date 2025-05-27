-- Exercise 1: User Upcoming Events
-- Show a list of all upcoming events a user is registered for in their city, sorted by date

SELECT 
    u.full_name,
    e.title AS event_title,
    e.description,
    e.start_date,
    e.end_date,
    e.city
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
    AND e.city = u.city
    AND e.start_date > CURRENT_DATE()
ORDER BY e.start_date ASC;

-- Sample Results:
-- full_name    | event_title              | description                    | start_date           | end_date             | city
-- Alice Johnson| Tech Innovators Meetup   | A meetup for tech enthusiasts. | 2025-06-10 10:00:00 | 2025-06-10 16:00:00 | New York
-- Bob Smith    | Frontend Dev Bootcamp    | Hands-on training on frontend  | 2025-07-01 10:00:00 | 2025-07-03 16:00:00 | Los Angeles
-- Diana King   | Tech Innovators Meetup   | A meetup for tech enthusiasts. | 2025-06-10 10:00:00 | 2025-06-10 16:00:00 | New York
-- Ethan Hunt   | Frontend Dev Bootcamp    | Hands-on training on frontend  | 2025-07-01 10:00:00 | 2025-07-03 16:00:00 | Los Angeles 