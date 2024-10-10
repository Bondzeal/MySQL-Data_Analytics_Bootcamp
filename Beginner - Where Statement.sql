# WHERE CLAUSE OR STATEMENT
# This is used to filter records within the data (rows of data)

SELECT *
FROM employee_salary;

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie' /* The equal to sign is one of comparison operators */
;
/* This only displays data about Lesie only */

SELECT *
FROM employee_salary
WHERE salary >= 50000 /* Getting employees who earn 50000 or more */
;

SELECT *
FROM employee_demographics
WHERE gender != 'Female' /* This is to filter employees who are not female */
;


-- Logical Operators -- AND OR NOT
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male' /* Adding another conditional statement */
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male'
;
-- OBSERVATIONS
/* From this output, it is seen that data for females who were born after 1985 was printed */
/* It is also seen that males who were born before or after 1985 had their data being printed as well */
/* In other words, the 'OR' statement is to satisfy either of the two conditions */

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male'
;
-- OBSERVATIONS
/* The data for all male who satisifed the first condition was printed */
/* The data for all female who did not satisfy the first condition was printed */

SELECT *
FROM employee_demographics
-- WHERE first_name = 'Leslie' AND age = 44 /* This prints out Leslie since she satisfied the condition */
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55 /* This only prints out employees who are above 44yrs */
;
-- OBSERVATION
/* With the last conditional statement 'OR', using the minus sign instead of equal to removes Lesie from it even though she satisfies the condition */

-- LIKE STATEMENT IN THE WHERE CLAUSE / STATEMENT
SELECT *
FROM employee_demographics
WHERE first_name = 'Jer'
;
-- OBSERVATION
/* Outputs nothing because there was nothing exactly like Jer in the names but those same letters are in Jerry */
/* This is why the LIKE statement has to be used for checking on data with the exact letter beings present */

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer'
;
-- OBSERVATION
/* Outputs nothing */
/* In the table, there is a first name that has Jer in it */
/* For this to be possible, there has to be an introduction of special character(s) '%' and '_' */

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;
-- OBSERVATION
/* It displayed a dataset for Jerry */
/* It looks out for anything that has Jer at the beginning and other letter follows it */

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';
/* This looks out for data with the characters er within it */
/* Here, it was only Jerry that was displayed */

-- Pointers
/* If an underscore "_" is introduced, the query looks out for data that matches it in terms of number of characters based on the number of underscores used */
/* The LIKE statement looks out for a specific sequence */