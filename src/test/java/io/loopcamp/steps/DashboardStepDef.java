package io.loopcamp.steps;

import io.cucumber.java.en.Given;
import io.loopcamp.pages.LoginPage;

public class DashboardStepDef {

    @Given("the {string} on the home page")
    public void the_on_the_home_page(String userType) {
        LoginPage loginPage = new LoginPage();
        loginPage.loginAs(userType);
    }
}
