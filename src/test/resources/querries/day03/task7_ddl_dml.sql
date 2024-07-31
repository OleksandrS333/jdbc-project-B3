SELECT * FROM EMPLOYEES;

-- DDL
-- CREATE TABLE

CREATE TABLE SCRUMTEAM (
                           EMP_ID NUMBER PRIMARY KEY,              -- NULL is not allowed, and since it it PK, it will also be UNIQUE
                           FIRST_NAME varchar(30) NOT NULL,        -- CANNOT BE NULL - data type String max 30 characters long
                           JOB_TITLE varchar(20) NOT NULL,         -- CANNOT BE NULL - data type String max 20 characters long
                           AGE INTEGER,                            -- There is not CONSTRAINTS -- it can be NULL, can be DUPLICATES
                           SALARY INTEGER                          -- There is not CONSTRAINTS -- it can be NULL, can be DUPLICATES
);


SELECT * FROM SCRUMTEAM;


-- DML
-- INSERT data
INSERT INTO SCRUMTEAM (EMP_ID, FIRST_NAME, JOB_TITLE, AGE, SALARY)
VALUES (1, 'Tom', 'QA', 25, 120000);


INSERT INTO SCRUMTEAM (EMP_ID, JOB_TITLE, FIRST_NAME, AGE, SALARY)
VALUES (2, 'QA', 'Winnie' , 27, 122000);

-- It is also possible to VALUE without providing COLUMN NAME but you have to provide VALUES in the order of COLUMN how they were CREATED (Default order)
INSERT INTO SCRUMTEAM
VALUES (3, 'James', 'SDET', 30, 130000);

INSERT INTO SCRUMTEAM
VALUES (4, 'Chris', 'SDET', 35, 135000);

INSERT INTO SCRUMTEAM
VALUES (5, 'Raul', 'PO', 35, 13000);

INSERT INTO SCRUMTEAM
VALUES (6, 'Sarah', 'DEV', 35, 145000);

-- TO SAVE all our changes
commit;

SELECT * from SCRUMTEAM;


-- DML
-- UPDATE
-- Increase their salary by 5000
SELECT SALARY+5000 FrOm SCRUMTEAM; -- this will change the values only on the result to see

select * from SCRUMTEAM;
UPDATE SCRUMTEAM
SET SALARY = SALARY + 5000;

UPDATE SCRUMTEAM
SET SALARY = SALARY + 100000
WHERE FIRST_NAME = 'Raul';

UPDATE SCRUMTEAM
SET SALARY = SALARY + 1000
WHERE AGE < 30;


-- DML
-- DELETE
DELETE FROM SCRUMTEAM
WHERE FIRST_NAME = 'Raul';

select * from SCRUMTEAM;
commit;


-- DDL
-- ALTER  - change structure of table (adding a column, removing column, renaming colum, rename table)
-- ADD Column
ALTER TABLE SCRUMTEAM
    ADD GENDER varchar(10);

UPDATE SCRUMTEAM
SET GENDER = 'Male'
WHERE FIRST_NAME = 'TOm';


-- DDL
-- ALTER
-- RENAME COLUMN
ALTER TABLE SCRUMTEAM
    RENAME COLUMN SALARY TO ANNUAL_SALARY;

SELECT * FROM SCRUMTEAM;


-- DDL
-- ALTER
-- DROP
ALTER TABLE SCRUMTEAM
    DROP COLUMN GENDER;


-- DDL
-- ALTER
-- RENAME TABLE
ALTER TABLE SCRUMTEAM
    RENAME TO AGILETEAM;

--SELECT * FROM SCRUMTEAM; -- This will give an ERROR becuase that table name does not exist anymore
SELECT * FROM AGILETEAM;


-- IQ: What is the difference between DROP, DELETE, TRUNCATE
-- DROP COLUMN - removes the whole Column
-- DELETE  ----- removes the whole ROW based on the WHERE CONDITION
-- TRUNCATE TABLE ---- will remove all the data row from the table but table structure is still there
-- DROP TABLE ----- will delete whole database table including structure

TRUNCATE TABLE AGILETEAM;
SELECT * FROM AGILETEAM;

DROP TABLE AGILETEAM;
SELECT * FROM AGILETEAM;

commit;