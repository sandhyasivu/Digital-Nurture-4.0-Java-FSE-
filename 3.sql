-- Exercise 3: Inactive Users
-- Retrieve users who have not registered for any events in the last 90 days

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    u.city,
    u.registration_date,
    MAX(r.registration_date) AS last_registration_date
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.user_id, u.full_name, u.email, u.city, u.registration_date
HAVING MAX(r.registration_date) IS NULL 
    OR MAX(r.registration_date) < DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
ORDER BY last_registration_date ASC;

-- Sample Results:
-- user_id | full_name    | email              | city        | registration_date | last_registration_date
-- 4       | Diana King   | diana@example.com  | New York    | 2025-01-15       | 2025-04-28
-- 5       | Ethan Hunt   | ethan@example.com  | Los Angeles | 2025-02-01       | 2025-06-15
-- 2       | Bob Smith    | bob@example.com    | Los Angeles | 2024-12-05       | 2025-05-02 