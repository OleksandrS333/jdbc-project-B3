package io.loopcamp.jdbctest.day01;

import java.sql.*;

public class p01_JDBCIntro {
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


        // We create Statement reference from Connection to execute the SQL Query
        Statement stmnt = conn.createStatement();
        //stmnt.executeQuery("SELECT * FROM REGIONS");

        // Now using teh stmnt reference we will execute SQL query and store the result into ResultSet
        ResultSet rs = stmnt.executeQuery("SELECT * FROM REGIONS");

        rs.next();

        System.out.println("rs.getString(\"REGION_ID\") = " + rs.getString("REGION_ID"));
        // We are getting VALUE is belongs to REGION_ID COLUMN, on the row that my cursor is on
        // Normally, methods need to match to the data type of Column
        System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString("REGION_NAME") );

        String rowOneRegionName = rs.getString("REGION_NAME");
        System.out.println("1st row Region Name: " + rowOneRegionName);

        rs.next();


        System.out.println("rs.getString(\"REGION_ID\") = " + rs.getInt("REGION_ID")); // We are getting VALUE is belongs to REGION_ID COLUMN, on the row that my cursor is on
        System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString("REGION_NAME") );

        System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString(2) ); // Indexes can start from 1


        rs.next();
        //System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString("Region_Name") ); // COLUMN NAMES have to be matching including CASE SENSITIVENESS
        System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString("REGION_NAME") ); // COLUMN NAMES have to be matching including CASE SENSITIVENESS
        System.out.println( "rs.getString(\"REGION_NAME\") = " + rs.getString(2) ); // Indexes can start from 1


        System.out.println();
        // Printing info/result in Dynamic way

        while (rs.next()) {
            System.out.println("Each Region ID: " + rs.getInt("REGION_ID"));
            System.out.println("Each Region Name: " + rs.getString("REGION_NAME"));
        }

        // This will give us an issue/exception saying basically the rows with info have finished - so it is null
        // System.out.println("Each Region Name: " + rs.getString("REGION_NAME"));


        System.out.println();
        //Q: How can I move back to the first row
        rs.first();
        System.out.println("Each Region ID: " + rs.getInt("REGION_ID"));
        System.out.println("Each Region Name: " + rs.getString("REGION_NAME"));

        // Q: Why this did not work
        // This will not work because we need to add some parameters into Statement declaration to be flexible for NAVIGATION


    }
}