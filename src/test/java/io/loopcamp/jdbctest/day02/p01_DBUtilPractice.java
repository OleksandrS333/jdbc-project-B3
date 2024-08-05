package io.loopcamp.jdbctest.day02;

import io.loopcamp.utility.DB_Utility;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class p01_DBUtilPractice {


    @DisplayName("DB Util Practice")
    @Test
    public void task1() {

        // create DB Connection with the hard codded value for dbUrl, dbUsername, dbPassword
        DB_Utility.createConnection();

        // run query
        DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES");


        // get all data from DB as List of Map
        List<Map<String, String>> listOfMap = DB_Utility.getAllRowAsListOfMap();


        // print each row
        for (Map<String, String> eachRow : listOfMap) {
            System.out.println(eachRow);
        }

        System.out.println("---------------------------");

        for (int i = 0; i <DB_Utility.getAllRowAsListOfMap().size() ; i++) {
            System.out.println(DB_Utility.getAllRowAsListOfMap().get(i));
        }


        System.out.println();
        System.out.println( DB_Utility.getFirstRowFirstColumn() );

        // get me 2nd row and 2nd column value
        System.out.println(DB_Utility.getCellValue(2, 2));


        // get the total row count
        System.out.println(DB_Utility.getRowCount());

        // close connection
        DB_Utility.destroy();

        // Since we closed the connection with DB, we cannot get any data from DB
        //System.out.println(DB_Utility.getRowCount());

    }
}