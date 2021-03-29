/*Query #1*/
SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

/*Query #2*/
SELECT count(id)
FROM students
WHERE cohort_id IN (1,2,3);

/*Query #3*/
SELECT name, id, cohort_id
FROM students
WHERE phone IS NULL
OR email IS NULL;

/*Query #4*/
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE ('%gmail.com%')
AND phone IS NULL;

/*Query #5*/
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

/*Query #6*/
SELECT name, email, phone
FROM students
WHERE end_date IS NOT NULL
AND github IS NULL;