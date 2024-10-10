-- JOINS 
-- allows two (2) or more tables to be brought together if they have a common column

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOINS returns rows that are the same in both columns from both tables
-- It outputs rows that have the same values from both tables
-- By default, JOIN represents inner join

SELECT *
FROM employee_demographics AS dem /* From aliasing */
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id /* Joining demographics table to salaries table */
;
-- OBSERVATION
/* It is observed that the joint table has no employee with id = 2 */
/* This is because employee with id = 2 is missing from the demographics table */

-- Selecting specific columns
SELECT dem.employee_id, age, occupation
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


-- OUTER JOIN
-- With this, there is RIGHT (OUTER) JOIN and LEFT (OUTER) JOIN
-- LEFT JOIN takes everything from the left even if there is no match and returns matches from the right table
-- Likewise for the RIGHT JOIN

SELECT *
FROM employee_demographics dem
LEFT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
-- OBSERVATION
/* The output is exactly as the previous output because the salary table was joined to the demographics table */
/* The LEFT JOIN takes everything from the demographics table */
/* Everything on the right table had a match with the exception of eployee with id no 2 */

SELECT *
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
-- OBSERVATION
/* If there is no match from the left it outputs null for that aspect of the table */
/* It then outputs everything from the salaries table */

-- SELF JOIN
/* This is a JOIN where you tie the table to itself */

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;


-- JOINING MULTIOLE TABLES 

SELECT *
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments;