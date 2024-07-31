/*
     BETWEEN Statement / Keyword
            -We use the BETWEEN operator to match a value against a range of values.
                For example;
                    Value BETWEEN low AND high
 */
SELECT * FROM Employees;


-- get me first name, salary who is making more than 7000 and department id is 80
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID from EMPLOYEES
WHERE SALARY > 7000 AND DEPARTMENT_ID = 80;


-- Get me first name, last name who is making more that 3000 and less than 6000
SELECT FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY > 3000 and SALARY < 6000 ;


-- Get me first name, last name who is making more than or equal to 3000  and less than or equal to 6000
SELECT FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY >= 3000 and SALARY <= 6000 ;


-- You can also do it with the BETWEEN clause
SELECT FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY between 3000 and 6000; -- BETWEEN will include the start and end points as well


-- get me all information who is working as IT_PROG or  SA_REP
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' or JOB_ID = 'SA_REP';