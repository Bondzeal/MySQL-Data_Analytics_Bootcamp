SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;
-- OBSERVATIONS
/* Average age of male is higher than that of females */

SELECT *
FROM employee_salary;

SELECT occupation
FROM employee_salary
GROUP BY occupation;
-- OBSERVATIONS
/* The group by statement only works when the name of column is also included in the select statement */
/* Unique values are displayed */

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;
-- OBSERVATIONS
/* In doing this, it is observed that the Officer Manager apeared twice in the table due to salary difference */
/* It still displayed unique values even though office manager appeared twice and it is due to difference in salary */

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;
-- OBSERVATIONS
/* It is observed that the maximum age of the Male is higher (61) than that of the females (46) */
/* The youngest employee is a female (29yo) whilst that of the male employees is 34yo */
/* The count aggregate function gives a total of male and female employees in the database */


-- ORDER BY

SELECT *
FROM employee_demographics
ORDER BY first_name
;
-- OBSERVATIONS
/* This automatically sorts out the data alphabetically */

SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;
-- OBSERVATOINS
/* This sorts out the data in descending order */

SELECT *
FROM employee_demographics
ORDER BY age, gender
;
-- OBSERVATIONS
/* Numbers could be used to replace column names. In this case, age = 4 and gender = 5 */

