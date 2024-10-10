-- COMMON TABLE EXPRESSION
 /* They allow a subquery block to be defined and referenced later within a main query */ 
 /* They are unique and they can only be used immediately after they have been created */
 /* The purpose of the CTE is to be able to perform more advanced calculations */

SELECT *
FROM employee_demographics;

SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	On dem.employee_id = sal.employee_id
GROUP BY gender;

-- observation
/* This displays rows of data for both male and female with their respective columns called from the select statement */

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	On dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

-- observation
/* This displays the same result as the one right above */

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	On dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;

-- observation
/* This outputs the average of the average salary for both make and female */

-- creating multiple CTEs and joining them 

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;

-- rewriting column names 

WITH CTE_Example (GENDER, AVG_SAL,MAX_SAL, MIN_SAL, COUNT_SAL) AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	On dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;