package io.loopcamp.pages;

import io.loopcamp.utility.Driver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class UserPage extends BasePage {
public UserPage(){PageFactory.initElements(Driver.getDriver(), this);}

    /* locate following
            mainSearchButon
            searchButton
            roleDropDown
            radioButtons
     */

    @FindBy(xpath = "(//span[.='Search']/..)[1]")
    public WebElement mainSearchButton;

    @FindBy(xpath = "//button[@class='text-none body-2 font-weight-medium v-btn v-btn--has-bg theme--light v-size--default primary']")
    public WebElement searchButton;

    @FindBy(xpath = "//label[.='Role']/following-sibling::input[1]")
    public WebElement roleDropDown;

    @FindBy(xpath = "//div[@role='radiogroup']//label")
    public List<WebElement> radioGroup;

    public void clickRadioButton (List<WebElement> radioGroup, String button) {
        for (int i = 0; i < radioGroup.size(); i++) {
            if(radioGroup.get(i).getText().equalsIgnoreCase(button)){
                radioGroup.get(i).click();
            }
        }
    }

    // also locate them by one

    @FindBy(xpath = "//label[.='Active']/..//input")
    public WebElement activeRadioButton;

    @FindBy(xpath = "//label[.='Inactive']/..//input")
    public WebElement inactiveButton;

    @FindBy(xpath = "//label[.='All']/..//input")
    public WebElement radioButtonAll;


}