SELECT * From employees;

-- Display all jobs which job title is "President", "Sales Manager", "Finance Manager"
SELECT * FROM JOBS
WHERE JOB_TITLE = 'President' OR JOB_TITLE = 'Sales Manager' OR JOB_TITLE = 'Finance Manager';

-- or
SELECT * FROM JOBS
WHERE JOB_TITLE IN ('President', 'Sales Manager', 'Finance Manager');


-- Display all Department that does NOT have manager_id
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- Display all Department that does NOT have manager_id and sort them in asc order based on department name
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL
ORDER BY DEPARTMENT_NAME ASC; -- by default it is ASC. SO, we can skip writing ASC


-- Display all information from Locations table where country_ID is US or UK
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID IN ('US','UK'); -- Since there is no UK, the result view will not show anything with UK

-- Display all information where country_id is NOT US or GB
SELECT * FROM COUNTRIES
WHERE COUNTRY_ID NOT IN ('US','GB')
ORDER BY COUNTRY_ID; --We just added this to sort

SELECT * FROM COUNTRIES
WHERE COUNTRY_ID != 'US' OR COUNTRY_ID != 'GB';


SELECT * FROM COUNTRIES
WHERE COUNTRY_ID <> 'US' OR COUNTRY_ID <> 'GB';


SELECT * FROM COUNTRIES
WHERE NOT COUNTRY_ID IN ('US') OR NOT COUNTRY_ID IN ('BG'); -- Yu can have NOT between WHERE and column name as well with IN clause


--Display all information where region id is 10 and country name is Belgium
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME = 'Belgium';


--Display all information where region id is 10 and country name is NOT Belgium
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME != 'Belgium';  --  >>>>>  != is same thing as <>

-- Display all information who does NOT work for any of these department id: 60, 90, 100, 120, 130
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID NOT IN (60, 90, 100, 120, 130);


-- Display first Name, last name, who does NOT work for any of these department id: 60, 90, 100, 120, 130
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (60, 90, 100, 120, 130);