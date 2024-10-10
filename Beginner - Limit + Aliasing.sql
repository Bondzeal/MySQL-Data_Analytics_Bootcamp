-- Limit tells helps you specify how many rows you want in your output

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
LIMIT 3
;
-- OBSERVATIONS
/* This outputs first 3 columns */

/* To limit to oldest employees */
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

/* To start at position 3 and go one row after it */
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;


-- ALIASING is a way to change the name of a column
-- It can also be used in the JOIN statements

SELECT gender, AVG(age) AS avg_age /* With or without AS it would still change only if the new name is included in the SELECT statement */
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

-- this can also be written as 
SELECT gender, AVG(age) AS avg_age 
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40