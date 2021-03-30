/*Query #1*/
SELECT count(assistance_requests) as total_assistances, name
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;


/*Query #2*/
SELECT count(assistance_requests) as total_assistances, students.name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;


/*Query #3*/
SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, completed_at-started_at as duration
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
ORDER BY duration;


/*Query #4*/
SELECT avg(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;


/*Query #5*/
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time;


/*Query #6*/
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;



/*Query #7*/
SELECT avg(started_at - created_at) as average_wait_time
FROM assistance_requests;


/*Query #8*/
SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;


/*Query #9*/
SELECT avg(total_duration) as average_total_duration
FROM (SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration) AS total_durations;

/*Query #10*/
SELECT assignments.id, name, day, chapter, count(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;


/*Query #11*/
SELECT day, count(*) as number_of_assignments, sum(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;


/*Query #12*/
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;


/*Query #13*/
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;


