-- Window functions
/* They allow partitions to be looked at */

SELECT gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- ibservation
/* This displays average salaries for both male and female */

SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

/* It can be observed that this doesn't affect the avg salary in any way but rather has the ability to provide extra info */

SELECT dem.first_name, dem.last_name, gender,
SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- ROLLING TOTAL
/* Starts at a specific value and adds the subsequent values within a row based on the partition */

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- observation
/* There is a difference between employee id and row number because in the demographics table there was no employee id = 2 */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- observation
/* The row numbers for male and female are different this time around */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- note
-- row number has no repititions but rank number may have 
-- if there is any repitition in rank number, the next number won't be the exact number that is meant to follow positionally
-- in this case, the next number that was meant to follow was 6 but it was rather 7

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- the difference here is that the dense rank number gives the next number numerically
-- in this case, after the double 5 it gave 6 as the next number 