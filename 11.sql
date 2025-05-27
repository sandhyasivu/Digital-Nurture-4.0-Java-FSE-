-- Exercise 11: Daily New User Count
-- Find the number of users who registered each day in the last 7 days

SELECT 
    DATE(created_at) AS registration_date,
    COUNT(user_id) AS new_users,
    GROUP_CONCAT(full_name) AS user_names
FROM Users
WHERE created_at >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
GROUP BY DATE(created_at)
ORDER BY registration_date DESC;

-- Sample Results:
-- registration_date | new_users | user_names
-- 2025-06-15       | 2         | Alice J., Bob Smith
-- 2025-06-14       | 1         | Charlie L.
-- 2025-06-13       | 0         | NULL 