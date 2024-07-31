/*
     Order By Statement / Keyword
            -The ORDER BY clause allows you to sort the rows returned from the SELECT statement in ascending or descending order based on criteria specified.
            -As a default it sorts as ASC (0-9 or a-z)
            -Also, we can sort based on index number too (Index starts from 1) as long as index is not out of bounds

     ASC - Ascending - (sorted from lowest to highest)  0 - 9  ---- a - z
     DESC -Descending - (sorted from highest to lowest) 9 - 0  ---- z - a
 */
SELECT * FROM EMPLOYEES;


-- From employees table, display all information based on salary in from highest to lowest order
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;



-- From employees table, display all information based on salary in from lowest to highest order
SELECT * FROM EMPLOYEES
ORDER BY SALARY ASC;

--OR
SELECT * FROM EMPLOYEES
ORDER BY SALARY; -- by default it is ASC (from lowest to highest)


-- You can also give the column INDEX instead of Column Name --- In Database, the indexes of columns starts from 1
SELECT * FROM EMPLOYEES
ORDER BY 8 ASC; -- by default it is ASC (from lowest to highest)


-- How about if you want to see only email but salary column as it is ordered by asc
SELECT EMAIL FROM EMPLOYEES
ORDER BY SALARY ASC;



-- Display all information from employees where employee id  < 150 based on first name in alphabetical order
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID < 150
ORDER BY FIRST_NAME ASC;



-- IQ: Display all information form employees based on First Name ascending and last name descending
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
ORDER BY FIRST_NAME ASC, LAST_NAME DESC;

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
ORDER BY FIRST_NAME, LAST_NAME DESC;




