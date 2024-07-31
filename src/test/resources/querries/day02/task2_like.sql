SELECT * FROM DEPARTMENTS;

/*
    LIKE

        % ----- > any sequence of characters --- > 'Jen%' --- > Starts with Jen ----- > % --> After 'Jen' any character is ok
        % ----- > any sequence of characters --- > '%ruz' --- > Ends with ruz ----- > % --> Before 'ruz' any character is ok

        _ ----- > any single character --------- > 'B___' --- > Starts with B and 4 character total
        _ ----- > any single character --------- > '__C' ---- > ENds with C and 3 character total
        _ ----- > any single character --------- > '_____' -- > Any String that is any 5 character total
 */


-- Display all employees whose first_name starts with B
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';

-- Display FIST NAME whose first_name starts with B
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%';


-- Display all info for employees whose first name starts with B and has 5 characters in total
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B____';



-- Display 5 letter first names where middle character is z
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__z__';


-- Display all info where middle character in fistname is z
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%';



-- Display all info who has 5 character long names
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_____';



-- Display all info where the first name 2nd character is a
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';



-- Display last_names whose first name ends with l
SELECT LAST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%l';


-- Display any job information with job_title ends with Manager
SELECT * FROM JOBS
WHERE JOB_TITLE LIKE '%Manager';
