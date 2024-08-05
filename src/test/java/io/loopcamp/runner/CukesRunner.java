package io.loopcamp.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "html:target/html-reports/cucumber-reports.html",
                "rerun:target/rerun.txt",
                "json:target/json-reports/json-report"
        },
        features = "src/test/resources/features",
        glue = "io/loopcamp/steps",
        dryRun = false,
        // Make console output for the Cucumber test much more readable and remove any unreadable character.
        // monochrome = false,
        tags = ""

)

public class CukesRunner {
}