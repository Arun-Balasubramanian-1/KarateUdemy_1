package conduitApp;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.KarateOptions;

// To Trigger specific tests with tags using KarateOptions
// cmd: mvn test -Dkarate.options="--tags @sanity"

@KarateOptions(tags = {"@sanity"})
class ConduitTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }    
}
