package conduitApp;

import com.intuit.karate.junit5.Karate;

class ConduitTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }    


    // To Trigger specific tests with the mentioned tags
    // cmd: mvn test -Dtest=ConduitTest#testTags
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@sanity").relativeTo(getClass());
    }
}
