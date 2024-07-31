package io.loopcamp.jdbctest.day01;

import java.sql.*;

public class p02_FlexibleNavigation {

    public static void main(String[] args) throws SQLException {
        // Connection String - these are info that we need to make connection (IP, Username, Password)
        String dbUrl = "jdbc:oracle:thin:@34.239.134.73:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        /*
            These steps help to make connection to database and do our needs
                1. Connection - to connect
                2. Statement - to execute our SQL query
                3. ResultSet - to store the result comes back

                These are coming from java.sql package
         */


        // DriverManager is a lass and has getConnection(); method which is used to make/create connection to DB
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);



        // Q: How can we make it flexible to be able to navigate through the rows?
        // This will not work because we need to add some parameters into Statement declaration to be flexible for NAVIGATION

        // We create Statement reference from Connection to execute the SQL Query
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        //ResultSet.TYPE_SCROLL_INSENSITIVE -- > This will help us to be able to scroll the cursor dynamically or to be able to JUMP directly to the raw we want
        //ResultSet.CONCUR_READ_ONLY --------- > with this, we are saying that we do not want to change anything in database, it makes the object reference IMMUTABLE



        // Now using teh stmnt reference we will execute SQL query and store the result into ResultSet
        ResultSet rs = stmnt.executeQuery("SELECT * FROM EMPLOYEES");


        rs.next();
        System.out.println("FIRST NAME of first row: " + rs.getString("FIRST_NAME"));
        System.out.println("FIRST PHONE of first row: " + rs.getString("PHONE_NUMBER"));


        System.out.println();
        while (rs.next()){
            System.out.println("SALARY: $" + rs.getString("SALARY"));
        }


        System.out.println();
        // Lets now go back to the first row
        rs.first();
        System.out.println("FIRST_NAME of first row: " + rs.getString("FIRST_NAME"));


        System.out.println();
        // How about if I want to jump to the specific row
        rs.absolute(9);
        System.out.println("FIRST_NAME: " + rs.getString("LAST_NAME"));


        System.out.println();
        // Can I get First Name, Last Name, and salary for the person last one
        rs.last();
        System.out.println("Last row Info:");
        System.out.println("\tFirst Name: " + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: " + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $" + rs.getString("SALARY"));


        System.out.println();
        // Can I get First Name, Last Name, and salary for the person one before
        rs.previous();
        System.out.println("One Previous row Info:");
        System.out.println("\tFirst Name: " + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: " + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $" + rs.getString("SALARY"));


        System.out.println();
        rs.absolute(12);
        rs.previous();
        System.out.println("One Previous row Info:");
        System.out.println("\tFirst Name: " + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: " + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $" + rs.getString("SALARY"));


        System.out.println();
        // I know you are at somewhere in rows, but can you give me all the Phone Numbers
        //rs.first();
        rs.beforeFirst();
        while (rs.next()) {
            System.out.println("Each Phone Number: " + rs.getString("PHONE_NUMBER"));
        }














    }

}