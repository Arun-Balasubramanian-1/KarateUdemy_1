package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import org.junit.jupiter.api.Test;

// To Trigger specific tests with tags using KarateOptions
// cmd: mvn test -Dkarate.options="--tags @sanity"

// To trigger tests based on the environment
// cmd: mvn test -Dkarate.env="dev"


// To cleanup target directory and run test
// cmd: mvn clean test

class TestRunner {

    @Test
    void testAll() {
        Results results = Runner.path("classpath:conduitApp").outputCucumberJson(true).parallel(4);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        System.out.println("hello world "+ karateOutputPath);
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Conduit Test");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}