const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON (teacher_id = teachers.id)
JOIN students ON (student_id = students.id)
JOIN cohorts ON (students.cohort_id = cohorts.id)
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

const cohortName = process.argv[2] || 'JUL02';
const values = [`${cohortName}`];

pool.query(queryString, values)
.then(res => {
  console.log('connected');
  res.rows.forEach(row => {
    console.log(`${row.cohort} : ${row.teacher}`)
  });
})
.catch(err => {
  console.log('query error', err.stack)
});