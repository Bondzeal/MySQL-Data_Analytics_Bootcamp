-- TRIGGERS AND EVENTS
/* A trigger is a block of code that executes automatically when an event takes place on a specific table */
/* In other words, they help update a table if a set of data is edited in another database (table) */


SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- observation
/* MySQL recognizes NEW as an event that takes place */
/* Here, the event that takes place is "after insert on employee_salary" */
/* Trigger doesn't have its own section within the schemas tab, it can rather be found in the employee_salary tab */

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation,
salary, dept_id)
VALUES (13, 'John-Ralpheo', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

-- observation
/* in executing this, a row with the provided details is created */
/* it can be seen when the employee_salary table is opened */
/* the row with employee id 13 can also be fdund in the employee demographics table */

-- EVENTS
/* an event takes place when it is scheduled */
/* it is more of a scheduled automator */ 

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    SELECT *
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

-- observation
/* in executing this, Jerry Gergich will be removed since he is above 60 */

SHOW VARIABLES LIKE 'event%'; 
