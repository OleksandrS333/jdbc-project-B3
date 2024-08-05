package io.loopcamp.jdbctest.day02;

import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class p02_DocuportDBTest {

    String dbDocuportUrl = ConfigurationReader.getProperty("docuport.db.url");
    String dbDocuportUsername = ConfigurationReader.getProperty("docuport.db.username");
    String dbDocuportPassword = ConfigurationReader.getProperty("docuport.db.password");


    @DisplayName("Docuport Db Practice")
    @Test
    public void task1() {

        DB_Utility.createConnection(dbDocuportUrl, dbDocuportUsername, dbDocuportPassword);

        DB_Utility.runQuery("SELECT * FROM document.users where role_name = 'advisor'");

        System.out.println(DB_Utility.getRowCount());

        int dbRowCount = DB_Utility.getRowCount();

        // For now, I just hard coded
        int uiRowCount = 7;

        Assertions.assertEquals(uiRowCount, dbRowCount);

        DB_Utility.destroy();

    }


}
