-- CASE STATEMENTS
/* They allow us to add logic to the SELECT statements */
/* Multiple WHEN statements can be added to a CASE statement */

SELECT *
FROM employee_demographics;

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
END AS logic
FROM employee_demographics;

-- observation
/* Here, only 1 employee is below 30 */

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
END AS logic
FROM employee_demographics;

-- observation
/* This displays old and young employees */
/* One employee had a null value in the logic column because his age was not specified and he is more than 50 */

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "On Retirement's Door"
END AS age_bracket -- logic
FROM employee_demographics;

-- observation
/* This sorts out the challenge stated above */

SELECT *
FROM employee_salary;

-- things to look out for:
-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- finance = 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 1.07
END AS new_salary
FROM employee_salary;

-- checking to see which employee is in the finance department
SELECT *
FROM parks_departments;

-- observation
/* there is only 1 employee in the finance department, dpt id is 6 */

-- adding another case statement to rectify bonus of employee in finance department 
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 1.07
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10 /* this gives additional 10% bonus of actual salary without the increment from > 50000 (7%) */
END AS bonus
FROM employee_salary;