package io.loopcamp.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.loopcamp.pages.BasePage;
import io.loopcamp.pages.UserPage;
import io.loopcamp.utility.BrowserUtil;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

public class UserPageStepDef {
    int dbTotalResultCount;

    UserPage userPage = new UserPage();

    @Given("the user navigates to {string} page")
    public void the_user_navigates_to_page(String moduleName) {
        userPage.navigateModule(moduleName);
    }
    @When("the user gets total user count")
    public void the_user_gets_total_user_count() {
        BrowserUtil.waitForVisibility(userPage.mainSearchButton, 10);
       userPage.mainSearchButton.click();
       userPage.clickRadioButton(userPage.radioGroup, "All");
       userPage.searchButton.click();
        BrowserUtil.waitFor(2);
        userPage.getResultCount();
        System.out.println(userPage.getResultCount());
    }
    @Then("verify user count information match in DB")
    public void verify_user_count_information_match_in_db() {
        DB_Utility.runQuery("SELECT * From identity.users");
        dbTotalResultCount = DB_Utility.getRowCount();
        Assert.assertEquals("Actual = " + dbTotalResultCount + " DOES NOT match Expected = " + userPage.getResultCount(), dbTotalResultCount, userPage.getResultCount());
    }
}
