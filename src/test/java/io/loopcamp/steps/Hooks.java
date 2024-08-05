package io.loopcamp.steps;


import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.BeforeStep;
import io.cucumber.java.Scenario;
import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.util.concurrent.TimeUnit;


public class Hooks {


    @Before("@db")
    public void setUpDB(){
        String url = ConfigurationReader.getProperty("docuport.db.url");
        String username = ConfigurationReader.getProperty("docuport.db.username");
        String password = ConfigurationReader.getProperty("docuport.db.password");

        DB_Utility.createConnection(url, username, password);
    }

    @After("@db")
    public void closeDBConn (){
        DB_Utility.destroy();
    }


    @Before("@ui")
    public void setUpUI (){
        Driver.getDriver().get(ConfigurationReader.getProperty("docuport.ui.url"));
    }


    @After("@ui")
    public void screenShot(Scenario scenario){
        if(scenario.isFailed()){
            final byte[] screenshot = ((TakesScreenshot) Driver.getDriver()).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot, "image/png", scenario.getName());
        }
        Driver.closeDriver();
    }
}
