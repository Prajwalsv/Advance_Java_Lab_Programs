package stringprograms;

public class StringOperations {
    public static void main(String[] args) {

        // 1. String Creation and Basic Operations
        String str1 = "Hello";
        String str2 = new String("World");
        System.out.println("String1: " + str1);
        System.out.println("String2: " + str2);

        // 2. Length and Character Access
        System.out.println("\nLength of str1: " + str1.length()); 
        System.out.println("Character at index 1: " + str1.charAt(1));

        // 3. String Comparison
        String s3 = "hello";
        System.out.println("\nEquals: " + str1.equals(s3));
        System.out.println("Equals Ignore Case: " + str1.equalsIgnoreCase(s3));

        // 4. String Searching
        String text = "Java Programming";
        System.out.println("\nIndex of 'Program': " + text.indexOf("Program"));
        System.out.println("Contains 'Java': " + text.contains("Java"));

        // 5. Substring Operations
        System.out.println("\nSubstring (0-4): " + text.substring(0, 4));

        // 6. String Modification
        System.out.println("\nReplace 'Java' with 'Python': " + text.replace("Java", "Python"));
        System.out.println("To UpperCase: " + text.toUpperCase());
        System.out.println("To LowerCase: " + text.toLowerCase());

        // 7. Whitespace Handling
        String ws = "   Welcome Java   ";
        System.out.println("\nBefore Trim: '" + ws + "'");
        System.out.println("After Trim: '" + ws.trim() + "'");

        // 8. String Concatenation
        String concat = str1 + " " + str2;
        System.out.println("\nConcatenation: " + concat);

        // 9. String Splitting
        String sentence = "Java,Python,C++";
        String[] parts = sentence.split(",");
        System.out.println("\nSplit Result:");
        for (String p : parts) {
            System.out.println(p);
        }

        // 10. StringBuilder Demo
        StringBuilder sb = new StringBuilder("Java");
        sb.append(" Programming");
        sb.insert(4, " Language");
        sb.replace(0, 4, "Core");
        System.out.println("\nStringBuilder Result: " + sb);

        // 11. String Formatting
        int age = 20;
        String formatted = String.format("My age is %d years", age);
        System.out.println("\nFormatted String: " + formatted);

        // 12. Validate Email
        String email = "example@gmail.com";
        if (email.contains("@") && email.startsWith("example") && email.endsWith(".com")) {
            System.out.println("\nValid Email");
        } else {
            System.out.println("\nInvalid Email");
        }
    }
}