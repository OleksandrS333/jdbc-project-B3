-- SQL QUERY statement
-- Get me ALL information of employees
SELECT * FROM EMPLOYEES;

-- SQL statements syntax are NOT case sensitive
-- Table names in DB are NOT case sensitive
select * from employees;
SeLeCt * FrOm employees;
SeLeCt * FrOm EmPLOyeeS;


SELECT FIRST_NAME FROM EMPLOYEES;
-- Column names in DB table are NOT case sensitive
SELECT FIRST_NAME, email FROM EMPLOYEES;


-- Get me first name and salary for employees
SELECT FIRST_NAME, SALARY FROM EMPLOYEES;


-- Get me all first name, last name and salary for employees
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;


-- Get me all information from departments table
SELECT * FROM DEPARTMENTS;

-- Get me city names from locations
SELECT city FROM LOCATIONS;


--Display country name and region id from countries
SELECT COUNTRY_NAME, REGION_ID from COUNTRIES;
SELECT REGION_ID, COUNTRY_NAME from COUNTRIES;
SELECT * FROM COUNTRIES;


--Get me job id and job title from jobs
SELECT JOB_ID, JOB_TITLE FROM JOBS;
SELECT * FROM JOBS;


-- Display street address, and postal code from location
SELECT STREET_ADDRESS, posTAL_Code FrOm LOCAtions;


-- Get e department names from Department table
SELECT DEPARTMENT_NAME from DepartMents;



-- Get me all information/regions from Regions
SELECT * From REGIONS;

-- Get me all region names from Regions
SELECT REGION_NAME from REGIONS;



SELECT FIRST_NAME, DEPARTMENT_NAME FROM EMPLOYEES, DEPARTMENTS;


