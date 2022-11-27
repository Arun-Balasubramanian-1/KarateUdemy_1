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

    public static String getAlphaNumericString(int n) {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            int index = (int)(AlphaNumericString.length() * Math.random()); 
            sb.append(AlphaNumericString.charAt(index));
        }
        return sb.toString();
    }
}
