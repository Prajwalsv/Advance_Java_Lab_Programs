package stringprograms;

public class StringHandlingDemo {
    public static void main(String[] args) {

        // 1. String Creation and Basic Operations
        String s1 = "Hello";
        String s2 = new String("World");
        System.out.println("String 1: " + s1);
        System.out.println("String 2: " + s2);

        // 2. Length and Character Access
        System.out.println("\nLength of s1: " + s1.length());
        System.out.println("Character at index 1: " + s1.charAt(1));

        // 3. String Comparison
        String s3 = "hello";
        System.out.println("\nEquals: " + s1.equals(s3));
        System.out.println("Equals Ignore Case: " + s1.equalsIgnoreCase(s3));

        // 4. String Searching
        String text = "Java Programming";
        System.out.println("\nIndex of 'Program': " + text.indexOf("Program"));
        System.out.println("Contains 'Java': " + text.contains("Java"));

        // 5. Substring Operations
        System.out.println("\nSubstring (0-4): " + text.substring(0, 4));

        // 6. String Modification
        System.out.println("\nReplace: " + text.replace("Java", "Python"));
        System.out.println("UpperCase: " + text.toUpperCase());
        System.out.println("LowerCase: " + text.toLowerCase());

        // 7. Whitespace Handling
        String ws = "   Welcome Java   ";
        System.out.println("\nBefore Trim: '" + ws + "'");
        System.out.println("After Trim: '" + ws.trim() + "'");

        // 8. String Concatenation
        String concat = s1.concat(" ").concat(s2);
        System.out.println("\nConcatenated String: " + concat);

        // 9. String Splitting
        String str = "Java,Python,C++";
        String[] arr = str.split(",");
        System.out.println("\nSplit Result:");
        for (String x : arr) {
            System.out.println(x);
        }

        // 10. StringBuilder Demo
        StringBuilder sb = new StringBuilder("Java");
        sb.append(" Programming");
        sb.insert(4, " Language");
        sb.replace(0, 4, "Core");
        System.out.println("\nStringBuilder Output: " + sb);

        // 11. String Formatting
        int age = 21;
        String formatted = String.format("My age is %d years", age);
        System.out.println("\nFormatted String: " + formatted);

        // 12. Email Validation (Improved logic)
        String email = "example@gmail.com";

        if (email.contains("@") && email.contains(".") &&
            email.startsWith("example") && email.endsWith(".com")) {
            System.out.println("\nValid Email");
        } else {
            System.out.println("\nInvalid Email");
        }
    }
}