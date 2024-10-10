-- STORED PROCEDURES
/* They are ways to save the SQL code so you can resuse over again */
/* When it is saved, it could be called and it will execute all the codes that were written in it */
/* It is helpful in storing complex queries, simplifies repititive codes and enhances performance overall */

SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

-- observation
/* this comes to the stored procedures within the schemas tab when it is refreshed */

-- using or executing the stored procedure that was created
CALL large_salaries();

-- creating stored procedure when there is a multiple query
-- with this there has to be an introduction of a delimiter
-- semicolon is one but this time around we will introduce the double dollar sign and this is the most common

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();

-- observation
/* This displays 2 seaparate results, one for salaries >= 50000 and the other for salaries >= 10000 */

-- note
-- by right-clicking on stored procedures in the schemas tab, check on how best to create one if the name you want to use exists */
-- always refer to that code when creating stored procedures

-- a stored procedure can be created in such a way that it will only provide the required output
-- here, we are looking at checking for the salary for an employee with an id number = 1

DELIMITER $$
CREATE PROCEDURE large_salaries3(check_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = check_id;
END $$
DELIMITER ;

CALL large_salaries3(1);

-- observation
/* this displays salary of employee with id number 1 */