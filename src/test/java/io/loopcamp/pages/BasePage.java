package io.loopcamp.pages;

import io.loopcamp.utility.Driver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BasePage {
    public BasePage () {
        PageFactory.initElements(Driver.getDriver(), this);
    }

    @FindBy (xpath = "//div[@class='v-list-item__title']//span")
    List <WebElement> allModules ;


    @FindBy(xpath = "//div[@class='v-data-footer__pagination']")
    public WebElement totalResultCount; // 1-4 of 4 ---- str.split(" ")[str.split(" ").length-1] --- >  4


    /*
        Write following methods

            navigateToModule (String moduleName)
            int getResultCount
     */
    public void navigateModule(String moduleName) {
        //Looping through list of all modules
        WebElement currentModule;
        for (int i = 0; i <allModules.size(); i++) {
            // making web element variable for each module
            currentModule = allModules.get(i);
            // if name match wi module name --> click it
            if(currentModule.getText().equalsIgnoreCase(moduleName)) {
                currentModule.click();
                break;
            }
        }
    }

    public int getResultCount() {
        int lastElement = 0;
        List<String> elementBySpace = new ArrayList<String>(Arrays.asList(totalResultCount.getText().split(" ")));
        lastElement =Integer.parseInt(elementBySpace.getLast()); ;
        //or
//        String resultCount = element.getText();
//        Integer count = Integer.parseInt(resultCount.substring(resultCount.lastIndexOf(" ")+1));
       return lastElement;
       // or we can return (count);
    }




}