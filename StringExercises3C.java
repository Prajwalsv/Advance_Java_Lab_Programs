package stringprograms;

import java.util.*;

public class StringExercises3C {

    // Q6. Capitalize first letter of each word
    public static String capitalizeWords(String str) {
        String[] words = str.split(" ");
        StringBuilder result = new StringBuilder();

        for (String word : words) {
            if (!word.isEmpty()) {
                result.append(Character.toUpperCase(word.charAt(0)))
                      .append(word.substring(1).toLowerCase())
                      .append(" ");
            }
        }
        return result.toString().trim();
    }

    // Q7. Truncate string and add ellipsis
    public static String truncate(String str, int length) {
        if (str.length() <= length) return str;
        return str.substring(0, length) + "...";
    }

    // Q8. Check if numeric
    public static boolean isNumeric(String str) {
        return str.matches("\\d+");
    }

    // Q9. Generate random string (fixed output using seed)
    public static String generateRandomString(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rand = new Random(10); // fixed seed
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < length; i++) {
            result.append(chars.charAt(rand.nextInt(chars.length())));
        }
        return result.toString();
    }

    // Q10. Count words
    public static int countWords(String str) {
        if (str.trim().isEmpty()) return 0;
        return str.trim().split("\\s+").length;
    }

    public static void main(String[] args) {

        // Q6
        String text1 = "java programming language";
        System.out.println("Capitalized: " + capitalizeWords(text1));

        // Q7
        String text2 = "Java is a powerful language";
        System.out.println("Truncated: " + truncate(text2, 10));

        // Q8
        String numStr = "12345";
        System.out.println("Is Numeric: " + isNumeric(numStr));

        // Q9
        System.out.println("Random String: " + generateRandomString(8));

        // Q10
        String text3 = "Java is easy to learn";
        System.out.println("Word Count: " + countWords(text3));
    }
}