-- Exercise 15: Event Session Time Conflict
-- Identify overlapping sessions within the same event

SELECT 
    e.event_id,
    e.title AS event_title,
    s1.session_id AS session1_id,
    s1.title AS session1_title,
    s1.start_time AS session1_start,
    s1.end_time AS session1_end,
    s2.session_id AS session2_id,
    s2.title AS session2_title,
    s2.start_time AS session2_start,
    s2.end_time AS session2_end
FROM Events e
JOIN Sessions s1 ON e.event_id = s1.event_id
JOIN Sessions s2 ON e.event_id = s2.event_id
WHERE s1.session_id < s2.session_id
    AND (
        (s1.start_time < s2.end_time AND s1.end_time > s2.start_time)
    )
ORDER BY e.event_id, s1.start_time;

-- Sample Results:
-- event_id | event_title        | session1_id | session1_title           | session1_start      | session1_end        | session2_id | session2_title           | session2_start      | session2_end
-- 1        | Tech Innovators   | 1           | Introduction to AI       | 2025-06-10 10:00:00 | 2025-06-10 11:30:00 | 2           | Machine Learning Basics  | 2025-06-10 11:00:00 | 2025-06-10 12:30:00