const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const argv = process.argv.slice(2);

pool.query(`
SELECT students.id, students.name, cohorts.name AS cohort
FROM students 
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${argv [0]}%'
ORDER BY students.id
LIMIT ${argv[1] || 5} ;
`)
.then(res => {
  res.rows.forEach (row => {
    console.log(`${row.name} has an id of ${row.id} and was in the ${row.cohort} cohort`)
  });
})
.catch(err => console.error('query error', err.stack));