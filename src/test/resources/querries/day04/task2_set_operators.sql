SELECT * FROM EMPLOYEES;

-- CREATED 2 simple tables called DEVELOPERS and TESTERS
CREATE TABLE DEVELOPERS (
                            ID_NUM INTEGER PRIMARY KEY,
                            NAMES VARCHAR(30), -- no CONSTRAINS provided --- > can be null, can be duplicate
                            SALARY INTEGER
);
SELECT * FROM DEVELOPERS;


CREATE TABLE TESTERS (
                         ID_NUM INTEGER PRIMARY KEY,
                         NAMES VARCHAR(30),
                         SALARY INTEGER
);
SELECT * FROM TESTERS;


INSERT INTO DEVELOPERS VALUES (1, 'Tom', 155000);
INSERT INTO DEVELOPERS VALUES (2, 'John', 142000);
INSERT INTO DEVELOPERS VALUES (3, 'Steve', 85000);
INSERT INTO DEVELOPERS VALUES (4, 'Mike', 120000);


INSERT INTO TESTERS VALUES (1, 'Olex', 120000);
INSERT INTO TESTERS VALUES (2, 'Julie', 130000);
INSERT INTO TESTERS VALUES (3, 'James', 140000);


UPDATE TESTERS
SET NAMES = 'Steve'
WHERE ID_NUM = 3;

commit;


/*
    UNION

        -same number of columns
        -same data type of columns
        -same order of the columns

        -combine two SQL query results WITH removing duplicates
 */

SELECT NAMES FROM DEVELOPERS --Tom - John - Steve - Mike
UNION
SELECT NAMES FROM TESTERS; -- Olex - Julie - Steve


/*
    UNION ALL

        -combine two SQL query results WITHOUT removing duplicates
 */


SELECT NAMES FROM DEVELOPERS --Tom - John - Steve - Mike
UNION ALL
SELECT NAMES FROM TESTERS; -- Olex - Julie - Steve


SELECT * FROM DEVELOPERS --Tom - John - Steve - Mike
UNION
SELECT * FROM TESTERS; -- Olex - Julie - Steve


/*
    MINUS
        From FIRST query result, it will remove the MATCHING one in 2nd query result

 */

SELECT NAMES FROm DEVELOPERS
MINUS
SELECT NAMES FROM TESTERS;

UPDATE TESTERS
SET NAMES = 'Steve'
where SALARY = 14000;
select * from TESTERS;
select NAMES from  DEVELOPERS;
select NAMES from TESTERS;

/*
    INTERSECT
        It will return the result which is in BOTH QUERIES
 */

SELECT SALARY FROM DEVELOPERS
INTERSECT
SELECT SALARY FROM TESTERS;


SELECT NAMES FROm TESTERS
INTERSECT
SELECT NAMES FROM DEVELOPERS;