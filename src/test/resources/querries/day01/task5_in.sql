/*
     IN CLOUSE
    -Click on “queries” click new file and name day01 package / task5_in_clouse.sql (must have .sql extension)

        In statement / Keyword
            -We use the IN operator with the WHERE clause to check if a value matches any value in a list of values.

            -The syntax of the IN operator is as follows:
                             value IN (value l, value2,...)

            -The list of values is not limited to a list of numbers or strings but also a result set of a SELECT statement as shown in the following query:
                            Value IN (SELECT value FROM tbl_name)

            -Just like with BETWEEN, you can use NOT to adjust an IN statement (NOT IN)
 */
SELECT * FROM EMPLOYEES;

-- IN works like OR logic
-- get me all information who is working as IT_PROG or  SA_REP
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' or JOB_ID = 'SA_REP';

-- We can write this with IN clause
SELECT * FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');


-- Get me city, country id from locations where country id is IT, US, UK
SELECT CITY, COUNTRY_ID FROM LOCATIONS
WHERE COUNTRY_ID IN ('IT', 'US', 'UK'); -- if one or all options are not in there, there will be no related result -- like UK


-- Get me employees where employee id is 134, 123, 145, 146
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 134 or EMPLOYEE_ID = 123 or EMPLOYEE_ID = 145 or EMPLOYEE_ID  = 146;

SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (134, 123, 145, 146);


SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN ('134', '123', '145', '146');



-- get me all information who is NOT working as IT_PROG or SA_REP
SELECT * FROM EMPLOYEES
WHERE JOB_ID NOT IN ('IT_PROG', 'SA_REP');



-- get me all employees where department id is not available
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;


-- get me all employees where department id is available / is not null
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;
