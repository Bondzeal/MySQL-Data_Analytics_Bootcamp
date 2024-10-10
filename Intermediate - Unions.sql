-- UNION
/* It allows rows of data to be combined together */
/* They may be from separate tables */

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
UNION
SELECT *
FROM employee_salary
;

-- observation
/* it can be seen that employee salary table was added to that of demographic's */

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

/* the obove is a bad data and it must not be done that way */

SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;