SELECT assignments.id, assignments.name,assignments.day, assignments.chapter, COUNT(*) AS total_requests
FROM assignments
JOIN assistance_requests ON (assignment_id = assignments.id)
GROUP BY assignments.id, assignments.name, assignments.chapter
ORDER BY total_requests DESC;