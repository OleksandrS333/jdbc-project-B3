/*
 SELECT DISTINCT keyword
    Instruction to remove duplicates from our request results. It does not remove it from TABLE itlself.
 */

SELECT * FROM EMPLOYEES;

--Display street address and postal code from location
SELECT STREET_ADDRESS, POSTAL_CODE FROM LOCATIONS;
-- Since we did not have duplicates, it still shows the same number of results
SELECT DISTINCT STREET_ADDRESS, POSTAL_CODE FROM LOCATIONS;


--Get me first name from employees
SELECT FIRST_NAME FROM EMPLOYEES; -- this will get all names
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES; -- this will get all names and remove duplicates and keep one copy


--Get me UNIQUE job ids from employees
--Get am the job ids from employees -- > do you need all?
-- YES
SELECT JOB_ID from EMPLOYEES;
-- NO, get me how many different job ids we have
SELECT DISTINCT JOB_ID from EMPLOYEES;



SELECT JOB_ID, SALARY from EMPLOYEES;
-- This will remove the duplicates from BOTH columns
SELECT DISTINCT JOB_ID, SALARY from EMPLOYEES;


--Get me unique country ids from locations
SELECT COUNTRY_ID from LOCATIONS;
SELECT DISTINCT COUNTRY_ID from LOCATIONS;

--Get me unique job_ids from jobs
SELECT JOB_ID from JOBS;  -- this will get you all SPECIFIC column info - JOB_ID
SELECT * from JOBS;  -- this will get you all the info with all columns
SELECT DISTINCT JOB_ID FROM JOBS; -- since I did not have duplicates, it shows same result as -- > SELECT JOB_ID from JOBS;
