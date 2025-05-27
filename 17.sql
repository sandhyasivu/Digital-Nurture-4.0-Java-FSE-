-- Exercise 17: Multi-Session Speakers
-- Identify speakers who are handling more than one session across all events

SELECT 
    sp.speaker_id,
    sp.full_name AS speaker_name,
    sp.email,
    COUNT(s.session_id) AS session_count,
    GROUP_CONCAT(DISTINCT s.title) AS session_titles
FROM Speakers sp
JOIN Sessions s ON sp.speaker_id = s.speaker_id
GROUP BY sp.speaker_id, sp.full_name, sp.email
HAVING session_count > 1
ORDER BY session_count DESC;

-- Sample Results:
-- speaker_id | speaker_name | email              | session_count | session_titles
-- 1          | Dr. Alan T.  | alan@example.com   | 2             | Introduction to AI, Machine Learning Basics
-- 2          | Ms. Jane Q.  | janeq@example.com  | 3             | HTML/CSS Fundamentals, JavaScript Basics, Advanced CSS 