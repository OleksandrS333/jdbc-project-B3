SELECT * FROM EMPLOYEES;

CREATE TABLE address (
                         ADDRESS_ID INTEGER PRIMARY KEY,
                         ADDRESS varchar(50) NOT NULL,
                         PHONE NUMBER NOT NULL
);

SELECT * FROM address;

INSERT INTO address (address_id, address, phone) VALUES (5, '123 Test Dr', 5005551234 );
INSERT INTO address (address_id, address, phone) VALUES (7, '456 Check Ln', 5005551235 );
INSERT INTO address (address_id, address, phone) VALUES (8, '789 Hi Dr', 5005551236 );
INSERT INTO address (address_id, address, phone) VALUES (10, '111 Bye Dr', 5005551237 );
INSERT INTO address (address_id, address, phone) VALUES (11, '222 Hola Dr', 5005551238 );



CREATE TABLE CUSTOMER (
                          CUSTOMER_ID INTEGER PRIMARY KEY,
                          FIRST_NAME VARCHAR(30) NOT NULL,
                          LAST_NAME VARCHAR(40) NOT NULL,
                          ADDRESS_ID INTEGER REFERENCES ADDRESS(ADDRESS_ID)
);

SELECT * FROM CUSTOMER;


INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID) VALUES (1, 'Tom', 'Jerry', 5 );
INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID) VALUES (2, 'Winnie', 'Pooh', NULL);
INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID) VALUES (3, 'Mickie', 'Mouse', 7);
INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID) VALUES (4, 'James', 'Bond', 8);
INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID) VALUES (5, 'Bruce', 'Lee', NULL);

commit;

/*
    INNER JOIN

        Get the info only matching portion of the tables
        Inner Join eliminates if there is NO MATCHING
        If you do not write "INNER JOIN" and just write "JOIN", by default it will act like INNER JOIN

 */

SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;

SELECT *
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT LAST_NAME, ADDRESS
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;

-- Just ADDRESS_ID column will give an issue, because there two and we need to define which one we want
SELECT LAST_NAME, ADDRESS, ADDRESS_ID
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;

-- To define, we can provide the table name --- > CUSTOMER.ADDRESS_ID or ADDRESS.ADDRESS_ID
SELECT LAST_NAME, ADDRESS, CUSTOMER.ADDRESS_ID
FROM CUSTOMER INNER JOIN ADDRESS ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


/*
    LEFT OUTER JOIN

        FULL LEFT table + matching ones from RIGHT table
        NOTE: LEFT OUTER JOIN ---- > can be written also --- >  LEFT JOIN
 */

SELECT *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;



/*
    LEFT OUTER JOIN with WHERE (with condition)

        This way we can find with dta from left table has no values in right table by doing WHERE condition IS NULL
        WHERE ____ IS NULL ---- > will give you unique ones (no related info in right table) from left table.
 */


SELECT *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID IS NULL;

-- This will give you the same result as above
SELECT *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL;

-- WHERE ____ IS NOT NULL ---- > will also give the same result as INNER JOIN
SELECT *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID IS NOT NULL;


/*
    RIGHT OUTER JOIN

        FULL RIGHT table + matching ones from LEFT table
        NOTE: RIGHT OUTER JOIN ---- > can be written also --- >  RIGHT JOIN
 */


SELECT *
FROM CUSTOMER RIGHT OUTER JOIN ADDRESS
                               ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;



SELECT FIRST_NAME, LAST_NAME, CUSTOMER.ADDRESS_ID, ADDRESS.ADDRESS_ID, ADDRESS, PHONE
FROM CUSTOMER RIGHT OUTER JOIN ADDRESS
                               ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT FIRST_NAME, LAST_NAME, CUSTOMER.ADDRESS_ID, ADDRESS.ADDRESS_ID, ADDRESS, PHONE
FROM CUSTOMER RIGHT JOIN ADDRESS
                         ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;



/*
    RIGHT OUTER JOIN with WHERE (with condition)

        This way we can find with data from right table has no values in left table by doing WHERE condition IS NULL
        WHERE ____ IS NULL ---- > will give you unique ones (no related info in left table) from right table.
 */


SELECT *
FROM CUSTOMER RIGHT OUTER JOIN  ADDRESS
                                ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL;


SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER RIGHT OUTER JOIN  ADDRESS
                                ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL;


SELECT *
FROM CUSTOMER RIGHT OUTER JOIN  ADDRESS
                                ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NOT NULL;


/*
 SAMPLE INTERVIEW QUESTION
    FInd the me the customer with their address and show me whose last name ends with 'y'
 */

SELECT *
FROM CUSTOMER INNER JOIN ADDRESS
                         ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE LAST_NAME LIKE '%y';

SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER INNER JOIN ADDRESS
                         ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE LAST_NAME LIKE '%y';


/*
    FULL OUTER JOIN

        It will show all data that is matching with both tables
        Plus, the one from left side + the one from right side ---- >  for both of these, it will rows will NULL
 */


SELECT *
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


/*
    FULL OUTER JOIN with WHERE
 */

-- how to show data with EXCLUDING THE MATCHING ONES/PART
SELECT *
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL
   OR ADDRESS.ADDRESS_ID IS NULL;


SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL
   OR ADDRESS.ADDRESS_ID IS NULL;



-- using aliases instead of table names
SELECT FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER C FULL OUTER JOIN ADDRESS A
                                ON C.ADDRESS_ID = A.ADDRESS_ID
WHERE C.ADDRESS_ID IS NULL
   OR A.ADDRESS_ID IS NULL;