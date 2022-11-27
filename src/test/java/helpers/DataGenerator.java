package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String generateRandomEmail() {
        Faker faker = new Faker();
        return faker.name().firstName() + CurrentTime.getTimeString() + "@yopmail.com";
    }

    public static String generateRandomUsername() {
        Faker faker = new Faker();
        return faker.name().firstName() + CurrentTime.getTimeString();
    }
}
