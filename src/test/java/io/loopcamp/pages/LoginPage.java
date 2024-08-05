package io.loopcamp.pages;

import io.loopcamp.data.User;
import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginPage extends BasePage {
    private static final Logger log = LoggerFactory.getLogger(LoginPage.class);

    public LoginPage() {PageFactory.initElements(Driver.getDriver(), this);}
    /*
        Locate followings elements
            emailInputBox
            passwordInputBox
            loginButton


        Write a method the logins

     */

    @FindBy(xpath = "//label[.='Username or email']//following-sibling::input")
    public WebElement usernameField;

    @FindBy(xpath = "//label[.='Password']//following-sibling::input")
    public WebElement passwordField;

    @FindBy(xpath = "//button[@type='submit']")
    public WebElement loginButton;

    public void loginAs(String userType) {
        try {
            if(User.userTypes.contains(userType)){
                String username= ConfigurationReader.getProperty(userType+ "_username");
                String password= ConfigurationReader.getProperty(userType+ "_password");
                usernameField.sendKeys(username);
                passwordField.sendKeys(password);
                loginButton.click();
            } else {
                throw new RuntimeException();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public void test() {
       loginAs("client");
       loginAs("advisor");
    }
}