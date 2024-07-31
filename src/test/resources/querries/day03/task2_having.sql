SELECT * FROm EMPLOYEES;

/*
 HAVING
 */
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT JOB_ID, COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT JOB_ID, MAX(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;


-- Display job_ids where the average salary is MORE THAN 5_000
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;


-- FIRST we found all the JOB_ID where SALARY is more than 5000
-- SECOND, we GROUPed them by the JOB_ID
-- LASTLY, we found the average
SELECT JOB_ID, COUNT(*), AVG(SALARY) FROM EMPLOYEES
WHERE SALARY > 5000
GROUP BY JOB_ID;


-- Display job_ids where the average salary is MORE THAN 5_000

-- Here, we are putting all data in group AFTER that we find avg salary for each group
-- If any average salary is over 5000 it will display
-- It works AFTER grouping them

SELECT JOB_ID, COUNT(*), AVG(SALARY) FROM EMPLOYEES
--WHERE SALARY > 5000
GROUP BY JOB_ID
HAVING AVG(SALARY) > 5000;

/*
    Difference between WHERE and HAVING with "Group By"

    WHERE --- > it filters to show the result BEFORE we put them in groups
    HAVING -- > it filters to show AFTER we put them in groups
 */


-- Display department_id where employees count is more that 5
SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5;



-- Display duplicate first names in employees
SELECT FIRST_NAME, COUNT(*) FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*)  > 1;

-- Display unique first names in employees
SELECT FIRST_NAME, COUNT(*) FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*)  = 1;