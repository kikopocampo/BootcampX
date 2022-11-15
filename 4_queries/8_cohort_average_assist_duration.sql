SELECT AVG(avg_duration_per_cohort.total_duration) AS average_total_duration
FROM (
SELECT sum(completed_at - started_at) as total_duration
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
) AS avg_duration_per_cohort;