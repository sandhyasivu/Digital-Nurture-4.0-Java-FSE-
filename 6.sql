-- Exercise 6: Event Resource Summary
-- Generate a report showing the number of resources (PDFs, images, links) uploaded for each event

SELECT 
    e.event_id,
    e.title,
    e.city,
    COUNT(CASE WHEN r.resource_type = 'pdf' THEN 1 END) AS pdf_count,
    COUNT(CASE WHEN r.resource_type = 'image' THEN 1 END) AS image_count,
    COUNT(CASE WHEN r.resource_type = 'link' THEN 1 END) AS link_count,
    COUNT(r.resource_id) AS total_resources
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id, e.title, e.city
ORDER BY total_resources DESC;

-- Sample Results:
-- event_id | title                | city        | pdf_count | image_count | link_count | total_resources
-- 1        | Tech Innovators     | New York    | 1         | 0           | 0          | 1
-- 2        | AI & ML Conference  | Chicago     | 0         | 1           | 0          | 1
-- 3        | Frontend Bootcamp   | Los Angeles | 0         | 0           | 1          | 1 