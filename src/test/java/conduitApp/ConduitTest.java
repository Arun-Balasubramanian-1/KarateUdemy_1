package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

// To Trigger specific tests with tags using KarateOptions
// cmd: mvn test -Dkarate.options="--tags @sanity"

// To trigger tests based on the environment
// cmd: mvn test -Dkarate.env="dev"


class TestRunner {

    @Test
    void testAll() {
        Results results = Runner.path("classpath:conduitApp").parallel(4);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}