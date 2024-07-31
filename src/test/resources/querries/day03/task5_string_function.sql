SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES; -- Made a VIEW/RESULT from EMPLOYEES table to show FIRST_NAME and LAST_NAME

-- ALIASES - helps us to change the column names / rename columns -- >  AS
SELECT FIRST_NAME AS "GIVEN NAME" FROM EMPLOYEES;
SELECT LAST_NAME AS "SURNAME" FROM EMPLOYEES;


-- Display annual salary for all employees -- > First Name, Last Name, Annual Salary
SELECT SALARY FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY * 12 AS "ANNUAL SALARY" FROM EMPLOYEES;

-- Make a raise on annual salary for them by 10K -- Display annual salary for all employees -- > First Name, Last Name, Annual Salary
SELECT FIRST_NAME, LAST_NAME, SALARY * 12 + 10000 AS "ANNUAL SALARY" FROM EMPLOYEES;



-- SINGLE ROW FUNCTIONS
-- CONCAT - Concatenation
-- In Java ---- > + ------ > first name + " " + last name ---- > Steven King
-- In SQL ----- > || ----- > first name || ' ' || last name -- > Steven King
-- In SQL ----- > CONCAT - > CONCAT(first name, last name) --- > Steven King

SELECT * FROM EMPLOYEES;
SELECT EMAIL || '@gmail.com' FROM EMPLOYEES;
SELECT EMAIL || '@gmail.com' AS FULL_EMAIL FROM EMPLOYEES;

-- or we can use CONCAT
SELECT CONCAT(EMAIL, '@gmail') FROM EMPLOYEES;
SELECT CONCAT(EMAIL, '@gmail') AS FULL_EMAIL FROM EMPLOYEES;


-- LOWER
SELECT LOWER (EMAIL || '@gmail.com') AS FULL_EMAIL FROM EMPLOYEES;

-- UPPER
SELECT UPPER (EMAIL || '@gmail.com') AS FULL_EMAIL FROM EMPLOYEES;

--INITCAP
SELECT EMAIL FROM EMPLOYEES;
SELECT INITCAP(EMAIL) FROM EMPLOYEES;

--LENGTH - display number of characters
SELECT EMAIL, LENGTH(EMAIL) FROM EMPLOYEES;
SELECT EMAIL, LENGTH(EMAIL) AS "NUM OF CHARS" FROM EMPLOYEES;
SELECT EMAIL, LENGTH(EMAIL) AS NUM_OF_CHARS FROM EMPLOYEES;
SELECT EMAIL, LENGTH(EMAIL) AS NUM_OF_CHARS FROM EMPLOYEES
ORDER BY NUM_OF_CHARS;
-- or
SELECT EMAIL, LENGTH(EMAIL) AS NUM_OF_CHARS FROM EMPLOYEES
ORDER BY 2 DESC; -- indexes start from 1
-- or
SELECT EMAIL, LENGTH(EMAIL) FROM EMPLOYEES
ORDER BY LENGTH(EMAIL) DESC;

--Display the result as following concatenation --- >  $first_name makes $salary salary
SELECT FIRST_NAME || ' makes $' || SALARY || ' salary' AS "EMPLOYEE SALARY INFO" FROM EMPLOYEES;


--SUBSTRING
-- Display all employees first 2 characters of First_Name
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 0, 2) FROM EMPLOYEES;
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 2) FROM EMPLOYEES;  -- 0 and 1 both represents first

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 2) FROM EMPLOYEES
WHERE FIRST_NAME = 'David';

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 2) FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';


-- Display all Initials from employees
SELECT FIRST_NAME, LAST_NAME, (SUBSTR(FIRST_NAME, 0, 1) || SUBSTR(LAST_NAME, 0, 1)) AS INITIALS FROm EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, (SUBSTR(FIRST_NAME, 0, 1) || SUBSTR(LAST_NAME, 0, 1)) AS INITIALS FROm EMPLOYEES
WHERE FIRST_NAME = 'Sundar';


-- Display all employees with first_name with 6 characters
SELECT FIRST_NAME FROm EMPLOYEES
WHERE FIRST_NAME LIKE '______';
-- or
SELECT FIRST_NAME FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;

SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;


-- Display how many employees with first_name being in 6 characters long
SELECT COUNT (FIRST_NAME) FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;


-- Display how many employees with first_name being in 6 characters long and not duplicates names
SELECT COUNT (DISTINCT FIRST_NAME) FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 6;

SELECT FIRST_NAME from EMPLOYEES
    where length(FIRST_NAME) = 6
order by FIRST_NAME asc ;
-- only first 6 names with 6 length
select length(FIRST_NAME), FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where FIRST_NAME in (SELECT FIRST_NAME from (Select FIRST_NAME, length(FIRST_NAME) from  EMPLOYEES
                                             where length(FIRST_NAME)=6 order by FIRST_NAME asc ) where ROWNUM < 7);
