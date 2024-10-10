-- SUBQUERIES 
/* A subquery is a query within another query */

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics
WHERE employee_id IN
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1) /* This subquery displays only employee ids whose dept id = 1 */
;

-- observation
/* This displays employees with their dept_id being = 1 */

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

-- observation
/* This displays the average salaries */

SELECT *
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS agg_table;

SELECT gender, AVG(`MAX(age)`) /* This is a name of a column now */
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS agg_table
GROUP BY gender
;

SELECT AVG(`MAX(age)`) /* This is a name of a column now */
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS agg_table
;
-- displaying average age of the column MAX(age)