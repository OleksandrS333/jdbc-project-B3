SELECT * FROM EMPLOYEES;


SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 90 ;



-- Display average salary for 'IT_PROG' ---- > IQ
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';


SELECT AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'; -- Here, we found what is the average salary for employees who works as IT_PROG job


SELECT MAX(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'; -- Here, we found what is the max salary for employees who works as IT_PROG job

SELECT MIN(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'; -- Here, we found what is the min salary for employees who works as IT_PROG job


-- Display average salary for 'SA_REP' --- > IQ
SELECT * FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');

SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

SELECT AVG(salary) FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';



----------------------------------------------------------------------------------------------------------
--NOTE: whenever, you see that in the question it says EACH and asks also for aggregate functions(sum, min, max, avg), that means use GROUP BY


SELECT DISTINCT JOB_ID FROM EMPLOYEES;
-- or
SELECT JOB_ID FROM EMPLOYEES
GROUP BY JOB_ID;

select *
from EMPLOYEES;


SELECT JOB_ID, AVG(SALARY), MAX(SALARY), MIN(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID;


-- Display sum of salary of each department (department_id)
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES;

SELECT DEPARTMENT_ID FROm EMPLOYEES
GROUP BY DEPARTMENT_ID;


SELECT DEPARTMENT_ID, SUM(SALARY) FROm EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Display average of salary of each department (department_id) and rounded decimal to be 2
SELECT DEPARTMENT_ID, ROUND (AVG(SALARY), 2) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Display, avg, max, min, sum of salary and count of each department_id
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 2), MAX(SALARY), MIN(SALARY), SUM(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 2), MAX(SALARY), MIN(SALARY), SUM(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, SALARY;


--
