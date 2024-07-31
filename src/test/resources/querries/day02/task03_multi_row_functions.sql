SELECT * FROM EMPLOYEES;

-- How many manger id we have
SELECT MANAGER_ID FROm EMPLOYEES; --this will show all the rows INCLUDING null
SELECT COUNT(MANAGER_ID) FROM EMPLOYEES; -- this will give me the count of all rows EXCLUDING null
SELECT COUNT(*) FROM EMPLOYEES; -- this will give me the count of all rows EXCLUDING NULL if the whole row is NULL


-- Get me the total count of unique first names
SELECT FIRST_NAME FROM EMPLOYEES; -- this will give me all first names
SELECT COUNT (FIRST_NAME) FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES; -- this will show all first names with NO DUPLICATES
SELECT COUNT (DISTINCT FIRST_NAME) FROM EMPLOYEES;


-- How many employees work as 'IT_PROG' or 'SA_REP'
SELECT COUNT (*) FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');


-- How many department_id we have?
SELECT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM EMPLOYEES;


-- How many department_id I have as empty in employees table?
SELECT department_id FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

SELECT COUNT (department_id) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; -- since COUNT is not including NULL, it will return 0


SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

SELECT COUNT(*) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; -- Since it counts based on all info and there is data for other columns, the result is 1
