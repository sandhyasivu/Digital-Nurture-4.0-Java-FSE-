-- Exercise 23: Registration Trends
-- Show a month-wise registration count trend over the past 12 months

SELECT 
    DATE_FORMAT(created_at, '%Y-%m') AS month,
    COUNT(registration_id) AS registration_count
FROM Registrations
WHERE created_at >= DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH), '%Y-%m-01')
GROUP BY month
ORDER BY month DESC;

-- Sample Results:
-- month     | registration_count
-- 2025-06   | 12
-- 2025-05   | 8 