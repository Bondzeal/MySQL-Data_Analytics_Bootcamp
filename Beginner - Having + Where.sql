-- Having and Where are used for filtering
-- Group by is used to group a set of data together (from preferred column)


SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40 /* This always comes after the group by ststaement */
;
-- OBSERVATIONS
/* The WHERE statement can't come before GROUP BY as it would give an error */
/* In this example, it was replaced with HAVING */
/* When there is an aggregate function, the command to be executed is secondary */
/* The first from the SELECT statement is executed before the second (if there is any) */
/* From this example when WHERE came before GROUP BY, it gave an error */
/* The output displays roles that have an average age above 40 */


SELECT *
FROM employee_salary;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
;
/* This displays average salaries of the manager role */

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;
-- OBSERVATIONS
/* Aggregate functions are always after the GROUP BY statement, ie HAVING AVG(salary), Here, the aggregate function was AVG(salary) */ 
/* It can be observed that WHERE statement does not have an aggregate function but the HAVING statement does */