/*
    WHERE Statement / Keyword
        - The WHERE clause appears right after the FROM clause of the SELECT statement.
        - The conditions are used to filter the rows returned from the SELECT statement.
        - SQL provides us with various standard operators to construct the conditions.

        Where Syntax
            SELECT column_1, column_2.. column_n
                FROM table_name
                WHERE conditions;
            Applies filter to result

            Select Where Statement - Operator - Description
                            =            Equal
                            >            Greater than
                            <            Less than
                            >=           Greater than or Equal
                            <=           Less than or equal
                            < > or !=    Not equal
                            =            Logical Operator AND
                            =            Logical operator OR
 */
SELECT * FROM JOBS;


-- Get me first name, last name from employees where first name is David
-- Data is CASE SENSITIVE
-- SINGLE quote is where we provide the Data
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David';


-- Get me all info from employees where first name is David
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'David';


-- Get me first name, last name, salary from employees where first name if David and last name is Lee
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Lee';

/*
 if (firstName.equals("David") && lastName.equals(""Lee)) { }
 */


-- Get me all information from employees table where salary if mot than 6000
SELECT * From EMPLOYEES
WHERE SALARY > 6000;
-- Why I did not provide single quote here?
-- Because the data type of that column is NUMBER (Int/Integer)


-- GEt me all information who is making less than or equal 6000
SELECT * FROM EMPLOYEES
WHERE SALARY <= 6000;


-- Get me eamil address for those who makes less than or equal 6000;
SELECT EMAIL from EMPLOYEES
WHERE SALARY <= 6000;
