package io.loopcamp.jdbctest.day01;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class p03_MetadataTest {
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


        /**
         DatabaseMetaData
         - will give us the information about the database itself
         - we use conn reference to make DatabaseMetaData reference
         */

        DatabaseMetaData dbMetaData = conn.getMetaData();
        System.out.println("DB username: " + dbMetaData.getUserName());
        System.out.println("DB Product Type: " + dbMetaData.getDatabaseProductName());
        System.out.println("DB Version Name: " + dbMetaData.getDatabaseProductVersion());
        System.out.println("DB Driver Name: " + dbMetaData.getDriverName());
        System.out.println("DB Driver Version: " + dbMetaData.getDriverVersion());


        System.out.println();
        /**
         ResultSetMetaData
         - will help us with the upper side of TABLE --- > COLUMNs (names, indexes)
         - we used rs reference to make ResultSetMetaData reference -- > by using the method .getMetaData
         */

        ResultSetMetaData rsmd = rs.getMetaData();

        // How many columns we have
        System.out.println("Column Count: " + rsmd.getColumnCount());


        // How to get the 1st column name
        System.out.println("1st Column Name: " + rsmd.getColumnName(1));
        System.out.println("1st Column Name: " + rsmd.getColumnName(2));


        // This will return the size of the Characters that can put for the specific column
        System.out.println(rsmd.getColumnDisplaySize(1));
        System.out.println(rsmd.getColumnDisplaySize(2));
        System.out.println(rsmd.getColumnDisplaySize(3));

        System.out.println();
        //  How can I get all the column names dynamcially
        // - I know how to get the total number of the column counts --- > .getColumnCounts(); -- > 11
        // - I know how to get the specific column name --- > .getColumnName(int i);

        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            //System.out.println(i);
            System.out.println(i + " - " + rsmd.getColumnName(i));
        }

        System.out.println("-------------------------------------------------------------------------");
        // Since we know how to jump through the rows and through columns, can we print all data dynamically

        // KEY ---- > Column Name
        // VALUE -- > data
        Map <String, String> firstPersonInfo = new LinkedHashMap<>();
        rs.next();
        //System.out.println(rsmd.getColumnName(1));
        //System.out.println(rs.getString(1));
        firstPersonInfo.put(rsmd.getColumnName(1), rs.getString(1));

        //System.out.println(rsmd.getColumnName(2));
        //System.out.println(rs.getString(2));
        firstPersonInfo.put(rsmd.getColumnName(2), rs.getString(2));

        // ..... you can continue all the way to the end of the column list
        System.out.println(firstPersonInfo);



        Map <String, String> secondPersonInfo = new LinkedHashMap<>();
        rs.next();
        //System.out.println(rsmd.getColumnName(1));
        //System.out.println(rs.getString(1));
        secondPersonInfo.put(rsmd.getColumnName(1), rs.getString(1));

        //System.out.println(rsmd.getColumnName(2));
        //System.out.println(rs.getString(2));
        secondPersonInfo.put(rsmd.getColumnName(2), rs.getString(2));

        // ..... you can continue all the way to the end of the column list
        System.out.println(secondPersonInfo);


        System.out.println("-------------------------------------------------------------------------");
        rs.beforeFirst();

        List < Map <String, String> > allInfo = new ArrayList<>();
        // while loop will help us to loop through the ROWS
        while (rs.next()){
            Map <String, String> eachPersonInfo = new LinkedHashMap<>();

            // with fori loop, I am going through columns
            for (int i = 1; i <= rsmd.getColumnCount() ; i++) {
                eachPersonInfo.put(rsmd.getColumnName(i), rs.getString(i));

            }

            allInfo.add(eachPersonInfo);
        }

        System.out.println(allInfo);

        System.out.println();
        for (Map <String, String> each : allInfo) {
            System.out.println(each);
        }


        System.out.println();
        // Get me the full info about the first person.
        System.out.println("First person: " + allInfo.get(0));


        // Get me the full info about last person
        System.out.println("Last person: " + allInfo.get(allInfo.size()-1));


        // Get me the 9th persons phone number
        System.out.println(allInfo.get(9-1).get("PHONE_NUMBER"));


        System.out.println("---------------------------------------------------");

        rs = stmnt.executeQuery("SELECT PHONE_NUMBER FROM EMPLOYEES WHERE EMPLOYEE_ID = 206");
        rs.next();
        System.out.println(rs.getString(1));


    }
}