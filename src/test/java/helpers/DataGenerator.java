package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

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

    public static JSONObject getArticlesBody() {
        JSONObject json = new JSONObject();
        json.put("title", getAlphaNumericString(10));
        json.put("description", getAlphaNumericString(40));
        json.put("body", getAlphaNumericString(100));
        return json;
    }
}
