# SELECTING EVERYTHING
SELECT * 
FROM employee_demographics; /* This prints out the entire table in employee_demographics */
/* This works only and only when the parks and recreation database is selected from the schemas */

SELECT *
FROM parks_and_recreation.employee_demographics; /* This works with sys double-clicked on before execution */
/* There is an error without this "parks_and_recreation." being added to the employee_demographics */

# SELECTING SOME PARTICULAR COLUMNS
SELECT first_name /* Selecting one column */
FROM employee_demographics;

SELECT first_name, gender /* Selecting multiple columns */
FROM employee_demographics;

# Alternative way or format of selecting multiple columns in a table
SELECT first_name,
last_name,
birth_date,
age,
age + 10 /*Adding 10yrs to the emloyees' ages. */
FROM employee_demographics;

# There is what is called PEMDAS which means Parentheses, Exponent, Multiplication, Division, Addition, Subtraction
# This is the order calculations would run by
# PEMDAS is an order of operations for arithmetic  or math within MySQL

# There is a DISTINCT statement which only selects unique values within a column

# Nothing happens to the output because all first names are unique.
# If there were repitions it would have only consisted of one of the values within that particular column.

SELECT DISTINCT first_name
FROM employee_demographics;

SELECT gender
FROM employee_demographics; /* This output shows that there were repetitions of gender */

SELECT DISTINCT gender
FROM employee_demographics; /* Here, it is seen that the output is male and female only */

