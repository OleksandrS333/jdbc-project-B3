package io.loopcamp.steps;

import io.cucumber.java.en.*;
import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

import java.util.Collections;
import java.util.List;

public class UserInfoStepsDef {

    List <String> actualDepNames;
    List <String> actualIdColumList;
    List <String> actualUserTableColumnName;

    @Given("Establish the database connection")
    public void establish_the_database_connection() {

        System.out.println("----------------------------");
        System.out.println("CONNECTION IS IN HOOKS CLASS");
        System.out.println("----------------------------");


    }

    @When("Execute query to get all columns for {string}")
    public void execute_query_to_get_all_columns_for(String tableName) {

        DB_Utility.runQuery("SELECT * FROM identity."+tableName);
        actualDepNames = DB_Utility.getColumnDataAsList("name");
        System.out.println("Actual Dept List" + actualDepNames);




    }

    @Then("verify the below columns are listed in result for")
    public void verify_the_below_columns_are_listed_in_result_for(List <String> expectedDepList) {

        Assert.assertEquals(expectedDepList, actualDepNames);
        System.out.println("Expected Dep List" + expectedDepList);

    }



    @When("Execute query to get all IDs from users")
    public void execute_query_to_get_all_i_ds_from_users() {
        String query = "select * from document.users";
        DB_Utility.runQuery(query);
        actualIdColumList = DB_Utility.getColumnDataAsList("id");
        //System.out.println(actualIdColumList);
    }
    @Then("verify all users has unique ID")
    public void verify_all_users_has_unique_id() {

        //actualIdColumList
        boolean hasDuplicates = false;

        for (String eachId : actualIdColumList) {

            int countEachID = Collections.frequency(actualIdColumList, eachId);

            if (countEachID > 1) {
                hasDuplicates = true;
                break;
            }
        }

        // hasDuplicates = true;

        Assert.assertTrue(!hasDuplicates);

    }


    @When("Execute query to get all columns")
    public void execute_query_to_get_all_columns() {
        DB_Utility.runQuery("select * from document.users");
        actualUserTableColumnName = DB_Utility.getAllColumnNamesAsList();

    }
    @Then("verify the below columns are listed in result")
    public void verify_the_below_columns_are_listed_in_result(List <String> expectedUserTableColumnName) {
        Assert.assertEquals(actualUserTableColumnName, expectedUserTableColumnName);
        //System.out.println("ACTUAL: " + actualUserTableColumnName);
        //System.out.println("EXPECTED: " + expectedUserTableColumnName);
    }

}