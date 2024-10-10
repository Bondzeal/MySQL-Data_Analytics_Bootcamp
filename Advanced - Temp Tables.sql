-- TEMPORARY TABLES
/* They are tables that are only visible to the session that they are created in */
/* Just as the name, when it is created and you exit SQL, it won't be there anymore */
/* It can be used to store intermediate results for complex queries */
/* It can be reused over and over again as long as you don't quit MySQL */

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Emmanuel','Ghartey','The Last of Us');

SELECT *
FROM temp_table;

-- observation
/* This displays the data inserted into the temp table */

SELECT *
FROM employee_salary;

-- Consider a subsection of the data above ie employee_salary
-- consider it as creating a temp table from an already-existiung table

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;

-- observation
/* it can be seen that there wasn't the need to insert data into it since the table already existed */

-- note
-- temp tables can be used as many times as possible only if the MySQL is not exited