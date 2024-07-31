SELECT * FROM EMPLOYEES;


SELECT * FROM EMPLOYEES
WHERE ROWNUM < 6;



SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC;

-- All salaries in DESC and with no DUP
SELECT DISTINCT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC;

-- BAD PRACTICE - because the DISTINCT will be applied after ROWNUM applied
SELECT DISTINCT SALARY FROM EMPLOYEES
WHERE ROWNUM < 6
ORDER BY SALARY DESC;




-- CORRECT - Display all first 5 highest salary
SELECT * FROM (SELECT DISTINCT (SALARY) from EMPLOYEES
               ORDER BY SALARY DESC)
WHERE rownum < 6; --  24000, 17000, 14000, 13500, 13000


-- Find me the employees info who is making 24000, 17000, 14000, 13500, 13000
-- HARD CODED
SELECT * FROM EMPLOYEES
WHERE SALARY IN (24000, 17000, 14000, 13500, 13000);

-- Display all info for first 5 highest salary
-- DYNAMIC
SELECT * FROM EMPLOYEES
WHERE SALARY IN  (SELECT * FROM (SELECT DISTINCT (SALARY) from EMPLOYEES
                                 ORDER BY SALARY DESC)
                  WHERE rownum < 6);  -- SALARY = 24000 or SALARY = 17000 .........




-- Display all info for first 10 highest salary
-- 1st - find all salary in descending order with not duplicates
SELECT DISTINCT SALARY FROm EMPLOYEES
ORDER BY SALARY DESC;


-- 2nd - once we did the step1st, lets cut th result to get the first 10
SELECT * FROM (SELECT DISTINCT SALARY FROm EMPLOYEES
               ORDER BY SALARY DESC)
WHERE ROWNUM <= 10;

-- 3rd find all info/people/employees who is making any of those first 10 highest salary
SELECT * FROM EMPLOYEES
WHERE SALARY IN (SELECT * FROM (SELECT DISTINCT SALARY FROm EMPLOYEES
                                ORDER BY SALARY DESC)
                 WHERE ROWNUM <= 10);



-- FInd all employees who make first 10 highest salary and the first name is not Alberto
SELECT * FROM (SELECT * FROM EMPLOYEES
               WHERE SALARY IN (SELECT * FROM (SELECT DISTINCT SALARY FROm EMPLOYEES
                                               ORDER BY SALARY DESC)
                                WHERE ROWNUM <= 10))
WHERE FIRST_NAME NOT IN ('Alberto');


SELECT * from (Select SALARY from EMPLOYEES order by SALARY desc);
SELECT * from (Select SALARY from EMPLOYEES order by SALARY desc)
where ROWNUM < 6;

SELECT * from EMPLOYEES
where SALARY in (Select * from (Select SALARY from EMPLOYEES order by SALARY desc) where ROWNUM < 8);
