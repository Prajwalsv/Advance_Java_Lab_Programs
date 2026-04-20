package stringprograms;

import java.util.Scanner;

public class TruncateExample {

    // User-defined function to shorten string and add ellipsis
    public static String truncate(String str, int length) {
        // If string length is less than or equal to given length, return as it is
        if (str.length() <= length) {
            return str;
        }
        // Otherwise, shorten and add "..."
        return str.substring(0, length) + "...";
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a string: ");
        String input = sc.nextLine();

        System.out.print("Enter maximum length: ");
        int len = sc.nextInt();

        String result = truncate(input, len);

        System.out.println("Truncated String: " + result);

        sc.close();
    }
}