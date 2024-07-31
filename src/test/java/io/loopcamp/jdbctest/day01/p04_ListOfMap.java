package io.loopcamp.jdbctest.day01;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class p04_ListOfMap {

    // Connection String - these are info that we need to make connection (IP, Username, Password)
    String dbUrl = "jdbc:oracle:thin:@34.239.134.73:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @DisplayName("Map recap")
    @Test
    public void test(){
        Map<String, Object> row1Map = new HashMap<>();
        row1Map.put("FIRST_NAME", "Steven");        // KEY -- > FIRST_NAME          VALUE -- > Steven
        row1Map.put("LAST_NAME", "King");           // KEY -- > LAST_NAME           VALUE -- > King
        row1Map.put("SALARY", 24000);               // KEY -- > SALARY              VALUE -- > 24000


        Map <String, Object> row2Map = new HashMap<>();
        row2Map.put("FIRST_NAME", "Neena");        // KEY -- > FIRST_NAME          VALUE -- > Neena
        row2Map.put("LAST_NAME", "Yang");          // KEY -- > LAST_NAME           VALUE -- > Yang
        row2Map.put("SALARY", 17000);              // KEY -- > SALARY              VALUE -- > 17000


        // After making Maps to store our data (hardcoded way), we stored all the maps into a list
        List<Map<String, Object>> expectedList = new ArrayList<>();
        expectedList.add(row1Map);
        expectedList.add(row2Map);

        System.out.println(expectedList);

    }

    @DisplayName("Storing Data from DataBase in List of Map")
    @Test
    public void test2 () throws SQLException {

        // We created connection between Java and Database using DriverManager class along with .getConnection(); method from java.sql package
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);


        // We created Statement to be able to execute SQL query and be able to jump through rows
        Statement stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


        // Using stmnt, we will execute and store the result data into ResultSet
        ResultSet rs = stmnt.executeQuery("SELECT * FROM EMPLOYEES");


        // With the ResultSetMetaData, I will be able to work with the UPPER side of the Table meaning COlUMN NAMES, COLUMN COUNTS
        ResultSetMetaData rsmd = rs.getMetaData();


        // These will give an issue becuase we are not on the row
        //System.out.println(rs.getString(1)); // you can get the value using rs.getString(index) or
        //System.out.println(rs.getString("EMPLOYEE_ID")); // or you can get the value using rs.getString(columnName)


        rs.next(); //  1st ROW
        Map <String, Object> row1MapActual = new HashMap<>();
        rsmd.getColumnName(2);  // 1st row -  2nd COLUMN NAME   ------ > FIRST_NAME
        rs.getString(2);        // 1st row -  2nd COLUMN VALUE  ------ > Steven
        row1MapActual.put(rsmd.getColumnName(2),  rs.getString(2));
        //row1MapActual.put(rsmd.getColumnName(3),  rs.getString(rsmd.getColumnName(3))); // It is possible but use the one that is easy for you.
        row1MapActual.put(rsmd.getColumnName(3),  rs.getString("LAST_NAME")); // this is same as all the other
        row1MapActual.put(rsmd.getColumnName(8),  rs.getString("SALARY"));



        rs.next();
        Map <String, Object> row2MapActual = new HashMap<>();
        rsmd.getColumnName(2);  // 2nd row -  2nd COLUMN NAME   ------ > FIRST_NAME
        rs.getString(2);        // 2nd row -  2nd COLUMN VALUE  ------ > Neena
        row2MapActual.put(rsmd.getColumnName(2),  rs.getString(2));
        //row2MapActual.put(rsmd.getColumnName(3),  rs.getString(rsmd.getColumnName(3))); // It is possible but use the one that is easy for you.
        row2MapActual.put(rsmd.getColumnName(3),  rs.getString("LAST_NAME")); // this is same as all the other
        row2MapActual.put(rsmd.getColumnName(8),  rs.getString("SALARY"));



        // After making the Map, lets store them into a List
        List <Map <String, Object>> actualList = new ArrayList<>();
        actualList.add(row1MapActual);
        actualList.add(row2MapActual);

        System.out.println(actualList);


        // Once you are done with the database, we need to close the connection.
        rs.close();
        stmnt.close();
        conn.close();


    }


}
