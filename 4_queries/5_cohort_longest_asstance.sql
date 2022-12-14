SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;

-- SELECT x.name, x.average_assistance_time
-- FROM 
-- (SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_assistance_time
-- FROM cohorts
-- JOIN students ON (cohort_id = cohorts.id)
-- JOIN assistance_requests ON (student_id = students.id)
-- GROUP BY cohorts.name) AS x
-- WHERE x.average_assistance_time = ( 
--   SELECT MAX(z.average_assistance_time)
--   FROM (SELECT cohorts.name AS name, AVG(completed_at - started_at) AS average_assistance_time
-- FROM cohorts
-- JOIN students ON (cohort_id = cohorts.id)
-- JOIN assistance_requests ON (student_id = students.id)
-- GROUP BY cohorts.name) AS z
--   )



