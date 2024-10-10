-- STRING FUNCTIONS
/* They are built-in functions that help us use and work with strings differently */

SELECT LENGTH('skyfall');

-- observation
/* This outputs the length of characters within the word skyfall */

SELECT *
FROM employee_demographics;

SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

-- observation
/* This outputs the number of characters within each first name */
/* This is according to the order of the data itself */

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-- observation
/* This sorts it out in ascending order */

SELECT UPPER('sky');

-- observation
/* This changes lowercase to uppercase */

SELECT LOWER('SKY');

-- observation
/* This changes uppercase to lowercase */

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

-- observation
/* This changes first names from lowercase to uppercase */

-- TRIM
/* There is left trim and right trim */
/* What is basically does is to take out leading and trailing whitespaces within some characters */

SELECT ('     sky ');

-- observation
/* Doing this brings whitespaces at the beginning and at the end as well */

SELECT LTRIM('     sky    ');

-- observation
/* This removes leading whitespaces */

SELECT RTRIM('     sky    ');

-- observation
/* This removes trailing whitespaces */

SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;

-- observation
/* This outputs first 4 characters starting from the left side within the first names provided within the table */

SELECT first_name, RIGHT(first_name, 4)
FROM employee_demographics;

-- observation
/* This outputs last 4 characters within the first names provided within the table */

SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2)
FROM employee_demographics;

-- observation
/* The numbers in the substring statement refers to position and number of characters respectively */

-- finding out which month everyone was born using substring 
SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) birth_month
FROM employee_demographics;

-- REPLACE
/* This replaces  specific characters with preferred characters */

-- SELECT first_name, REPLACE(first_name, 'a','z') /* This replaces all 'a' with 'z' */
-- FROM employee_demographics;

-- LOCATE
/* This is used to look for the position of a specific character within a string */

SELECT LOCATE('a','Emmanuel');

-- observation
/* This displays the position of 'a' in the word Emmanuel */

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

-- observation
/* This displays the position of 'An' characters within the first names */

-- note
-- 2 columns can be combined together using the concat statement

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) full_name
FROM employee_demographics;

-- observation
/* This displays the combined rows */
/* This then displays full names */